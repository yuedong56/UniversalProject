//
//  NSString+Helper.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

/** 是否是有效的邮箱地址 */
- (BOOL)isValidateEmail;
/** 是否是有效的手机号 */
- (BOOL)isValidatePhoneNumber;
/** 是否是有效的身份证号 */
- (BOOL)isValidateIDNumber;

@end
