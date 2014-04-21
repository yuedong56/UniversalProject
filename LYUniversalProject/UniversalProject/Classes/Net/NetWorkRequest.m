//
//  NetWorkRequest.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

/**
 * @brief 检查网络，若网络不可用则弹出提示
 */
+ (BOOL)checkNetWorkStateAndShowAlertView
{
    if (![LYUtils checkNetworkAvailable]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"当前网络不可用！"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"确定", nil];
        [alertView show];
        return NO;
    } else {
        return YES;
    }
}

/**
 * @brief 启动一个get请求
 */
+ (void)startGetRequestWithURL:(NSString *)urlStr
                    requestKey:(NSString *)key
                         block:(void(^)(NSDictionary *jsonDic, NSError *error))block
{
    //先utf8转一下，以防urlStr里含有汉字
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    __unsafe_unretained __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            NSData *jsonData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error = nil;
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            block(jsonDic,nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

@end
