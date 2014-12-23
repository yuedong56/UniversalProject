//
//  LYSandBoxManager.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-10-11.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "LYSandBoxUtils.h"

@implementation LYSandBoxUtils

#pragma mark - 公共方法

/** 获取沙盒里 Home 目录 */
+ (NSString *)home
{
    return NSHomeDirectory();
}

/** 获取 Document 目录 */
+ (NSString *)document
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

/** 获取 Cache 目录 */
+ (NSString *)cache
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

/** 获取 Library 目录 */
+ (NSString *)library
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

/** 获取 Tmp 目录 */
+ (NSString *)tmp
{
    return NSTemporaryDirectory();
}

/**
 * @brief   新建一个文件夹（包含判断文件夹是否存在）
 * @param   path 文件夹所在路径
 * @param   name 文件夹名称
 * @return  成功/失败
 */
+ (BOOL)creatDirectoryAtPath:(NSString *)path name:(NSString *)name
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *newDirectory = [path stringByAppendingPathComponent:name];
    
    //创建目录
    if ([fileManager fileExistsAtPath:newDirectory]) {
        CLog(@"该路径的文件夹已经存在：%@",newDirectory);
        return YES;
    }
    BOOL isSuccess = [fileManager createDirectoryAtPath:newDirectory
                            withIntermediateDirectories:YES
                                             attributes:nil
                                                  error:nil];
    if (isSuccess) {
        CLog(@"文件夹创建成功：%@",newDirectory);
    }
    return isSuccess;
}

@end


