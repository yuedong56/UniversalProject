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

/**
 * @brief 检查网络是否可用
 */
+ (BOOL)checkNetworkAvailable;

/**
 * @brief 检查网络状态类型（wifi、2G/3G）
 */
+ (NetworkStatus)checkNetworkStateType;

/** 
 * @brief md5 16位加密 （小写）
 */
+ (NSString *)md5:(NSString *)str;

/**
 * @brief 获取photo句柄单例
 */
+ (ALAssetsLibrary *)defaultAssetsLibrary;

#pragma mark - 本工程公共方法


@end
