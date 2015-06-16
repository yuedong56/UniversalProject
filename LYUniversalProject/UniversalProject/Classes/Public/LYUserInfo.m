//
//  ETTUserInfo.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "LYUserInfo.h"

@implementation LYUserInfo

BOOL GlobalGetBoolValue(NSString* key) {
    return [[NSUserDefaults standardUserDefaults] boolForKey: key];
}

void GlobalSetBoolValue(BOOL value, NSString* key) {
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    if ([userdefault objectIsForcedForKey:key]) {
        [userdefault removeObjectForKey:key];
    }
    [userdefault setBool:value forKey:key];
    [userdefault synchronize];
}

id GlobalGetValue(NSString* key) {
    return [[NSUserDefaults standardUserDefaults] objectForKey: key];
}

void GlobalSetValue(id value, NSString* key) {
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    if ([userdefault objectIsForcedForKey:key]) {
        [userdefault removeObjectForKey:key];
    }
    [userdefault setObject:value forKey:key];
    [userdefault synchronize];
}

@end
