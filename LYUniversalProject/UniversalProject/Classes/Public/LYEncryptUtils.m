//
//  LYEncryptManager.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "LYEncryptUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation LYEncryptUtils

/** md5 16位加密 （小写）*/
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

@end
