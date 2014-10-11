//
//  NetWorkRequest.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

#pragma mark - 私有公共方法
/** 检查网络，若网络不可用则弹出提示（该方法有bug，不准确）*/
+ (BOOL)checkNetWorkStateAndShowAlertView
{
    if (![LYUtils checkNetworkAvailable]) {
        return NO;
    } else {
        return YES;
    }
}

/** 启动一个get请求 */
+ (void)startGetRequestWithURL:(NSString *)urlStr
               requestUserName:(NSString *)userName
                         block:(void(^)(NSDictionary *jsonDic, NSError *error))block
{
    if (![self checkNetWorkStateAndShowAlertView])
    {
        block(nil,nil);
        return;
    }
    
    //先utf8转一下，以防urlStr里含有汉字
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    if (userName) request.username = userName;
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            block([LYUtils toDictionaryWithJsonString:[request responseString]],nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

/** 启动一个POST请求 */
+ (void)startPostRequestWithURL:(NSString *)urlStr
                     parameters:(NSDictionary *)parameters
                requestUserName:(NSString *)userName
                          block:(void(^)(NSDictionary *jsonDic, NSError *error))block
{
    if (![self checkNetWorkStateAndShowAlertView])
    {
        block(nil,nil);
        return;
    }
    
    //先utf8转一下，以防urlStr里含有汉字
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    if (userName) request.username = userName;
    [request setRequestMethod:@"POST"];
    
    for (NSString *key in [parameters allKeys]) {
        [request setPostValue:[parameters objectForKey:key] forKey:key];
    }
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            block([LYUtils toDictionaryWithJsonString:[request responseString]],nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

@end
