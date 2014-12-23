//
//  ETTUtils.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//
//  常用公共方法

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface LYUtils : NSObject

#pragma 通用公共方法

/** 检查网络是否可用 */
+ (BOOL)checkNetworkAvailable;

/** 检查网络状态类型（wifi、2G/3G）*/
+ (NetworkStatus)checkNetworkStateType;

/** 将json字符串转为字典(NSDictionary) */
+ (NSDictionary *)toDictionaryWithJsonString:(NSString *)jsonStr;

/** 将id类型(如NSArray、NSDictionary)转为json字符串 */
+ (NSString *)toJsonStringWithData:(id)data;

/** 获取photo句柄单例 */
+ (ALAssetsLibrary *)defaultAssetsLibrary;

/** 评分、升级 */
+ (void)jumpToAppstore;

#pragma mark - 本工程公共方法


@end
