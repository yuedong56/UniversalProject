//
//  NSString+Helper.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

/**
 *  是否空字符串
 */
- (BOOL)isEmptyString;

/**
 *  写入 NSUserDefaults
 */
- (void)saveToUserDefaultsWithKey:(NSString *)key;

@end
