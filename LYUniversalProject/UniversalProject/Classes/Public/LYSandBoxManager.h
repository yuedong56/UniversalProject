//
//  LYSandBoxManager.h
//  LYUniversalProject
//
//  Created by 老岳 on 14-10-11.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYSandBoxManager : NSObject

#pragma mark - 公共方法
/** 获取沙盒里 Home 目录 */
+ (NSString *)home;

/** 获取 Document 目录 */
+ (NSString *)document;

/** 获取 Cache 目录 */
+ (NSString *)cache;

/** 获取 Library 目录 */
+ (NSString *)library;

/** 获取 Tmp 目录 */
+ (NSString *)tmp;

/**
 * @brief   新建一个文件夹（包含判断文件夹是否存在）
 * @param   path 文件夹所在路径
 * @param   name 文件夹名称
 * @return  成功/失败
 */
+ (BOOL)creatDirectoryAtPath:(NSString *)path name:(NSString *)name;

@end


