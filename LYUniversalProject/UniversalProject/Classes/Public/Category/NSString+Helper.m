//
//  NSString+Helper.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"^([a-z0-9]+[_|-|.]?)*[a-z0-9]+@([a-z0-9]+[_|-|.]?)*[a-z0-9]+.[a-z]{2,3}$";
//    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidatePhoneNumber
{
    NSString *phoneRegex = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isValidateIDNumber
{
    NSString *idRegex = @"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$";
    NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",idRegex];
    return [idTest evaluateWithObject:self];
}

@end



