//
//  ETTUtils.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "LYUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LYUtils

#pragma mark - 通用公共方法

/** 检查网络是否可用 */
+ (BOOL)checkNetworkAvailable {
	Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
    
    if (status == NotReachable) {
        return NO;
    } else {
        return YES;
    }
}

/** 检查网络状态类型（wifi、2G/3G）*/
+ (NetworkStatus)checkNetworkStateType {
	Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
	return status;
}

/** 将json字符串转为字典(NSDictionary) */
+ (NSDictionary *)toDictionaryWithJsonString:(NSString *)jsonStr
{
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    return jsonDic;
}

/** 将id类型(如NSArray、NSDictionary)转为json字符串 */
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

/** md5 16位加密 （小写）*/
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

/** 获取photo句柄单例 */
+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred,
                  ^{
                      library = [[ALAssetsLibrary alloc] init];
                  });
    return library;
}

/** 评分、升级 */
+ (void)jumpToAppstore
{
    NSString *iTunesLink = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@?mt=8", AppID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}

#pragma mark - 本工程公共方法

@end


