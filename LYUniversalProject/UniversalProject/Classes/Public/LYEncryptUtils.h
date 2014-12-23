//
//  LYEncryptUtils.h
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//
//  加密类

#import <Foundation/Foundation.h>

@interface LYEncryptUtils : NSObject

/** md5 16位加密 （小写）*/
+ (NSString *)md5:(NSString *)str;

@end
