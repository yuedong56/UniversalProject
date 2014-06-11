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
/**
 * @brief 检查网络，若网络不可用则弹出提示
 */
+ (BOOL)checkNetWorkStateAndShowAlertView
{
    if (![LYUtils checkNetworkAvailable]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:NetUnavailablePrompt
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
    __unsafe_unretained __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    if (userName) request.username = userName;
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            block([self toDictionaryWithJsonString:[request responseString]],nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

/**
 * @brief 启动一个POST请求
 */
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
    
    __unsafe_unretained __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    if (userName) request.username = userName;
    [request setRequestMethod:@"POST"];
    
    for (NSString *key in [parameters allKeys]) {
        [request setPostValue:[parameters objectForKey:key] forKey:key];
    }
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            block([self toDictionaryWithJsonString:[request responseString]],nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

/**
 * @brief 将json字符串转为字典(NSDictionary)
 */
+ (NSDictionary *)toDictionaryWithJsonString:(NSString *)jsonStr
{
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    return jsonDic;
}

/**
 * @brief 将id类型(如NSArray、NSDictionary)转为json字符串
 */
+ (NSString *)toJsonStringWithData:(id)data
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

@end
