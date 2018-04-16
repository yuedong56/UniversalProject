//
//  DataManager.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//
//  数据库管理

#define DataFileName @"DataFileName.sqlite" //数据库文件名

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)instance;

@end
