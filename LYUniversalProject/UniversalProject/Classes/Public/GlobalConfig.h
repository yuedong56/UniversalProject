//
//  GlobalConfig.h
//  四中网校-ios
//
//  Created by 老岳 on 14-4-21.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#ifndef _____ios_GlobalConfig_h
#define _____ios_GlobalConfig_h

#import "LYAppDelegate.h"
#import "Reachability.h"
#import "NetWorkRequest.h"
#import "LYUtils.h"
#import "DataManager.h"

//AppDelegate
#define APP_DELEGATE ((LYAppDelegate *)[[UIApplication sharedApplication] delegate])

//无网络提示语
#define NetUnavailablePrompt @"当前网络不可用！"

//应用的AppID
#define AppID @"915711237"

//打印
#ifdef DEBUG
#define CLog(format, ...) NSLog(format,##__VA_ARGS__)
#else
#define CLog(format, ...)
#endif

//尺寸、版本
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7AndLater (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) ? YES : NO)
#define IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//颜色
#define COLOR_RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define COLOR_RGB(R, G, B) [UIColor colorWithRed:(R/255.0f) green:(G/255.0f) blue:(B/255.0f) alpha:1]
#define COLOR_N(INT) [UIColor colorWithRed:(INT/255.0f) green:(INT/255.0f) blue:(INT/255.0f) alpha:1]
#define COLOR_F(Float) [UIColor colorWithRed:(Float) green:(Float) blue:(Float) alpha:1]

#define ClearColor [UIColor clearColor]              //透明色
#define WhiteColor [UIColor whiteColor]              //白色
#define BlackColor [UIColor blackColor]              //黑色
#define GrayColor [UIColor grayColor]                //灰色
#define LightGrayColor [UIColor lightGrayColor]      //浅灰色
#define DarkGrayColor [UIColor darkGrayColor]        //深灰色
#define RedColor [UIColor redColor]

//16进制的颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//图片
#define ImageWithFile(name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]])
#define ImageNamed(name) [UIImage imageNamed:name]

#endif
