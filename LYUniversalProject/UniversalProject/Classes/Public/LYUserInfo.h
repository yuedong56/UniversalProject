//
//  ETTUserInfo.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//
//  工程里所有要存到 NSUserDefaults 里的东西，可以存到这个类

#import <Foundation/Foundation.h>

@interface LYUserInfo : NSObject

BOOL GlobalGetBoolValue(NSString* key);
void GlobalSetBoolValue(BOOL value, NSString* key);

id   GlobalGetValue(NSString* key);
void GlobalSetValue(id value, NSString* key);

@end
