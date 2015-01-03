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
#import "NetWorkRequest.h"
#import "DataManager.h"

#import "NSString+Helper.h"

#import "UIView+Helper.h"
#import "UIViewController+Helper.h"
#import "UILabel+Common.h"
#import "UIButton+Common.h"
#import "UIImageView+Common.h"
#import "UIAlertView+Common.h"

#import "LYUtils.h"
#import "LYUserInfo.h"
#import "LYSandBoxUtils.h"
#import "LYEncryptUtils.h"
#import "LYTimeUtils.h"

//AppDelegate
#define APP_DELEGATE ((LYAppDelegate *)[[UIApplication sharedApplication] delegate])

//无网络提示语
#define NetUnavailablePrompt @"当前网络不可用！"

//应用的AppID
#define AppID @""

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
#define RedColor [UIColor redColor]                  //红色

//字号
#define FONT(X) [UIFont systemFontOfSize:X]
#define FONT_BOLD(X) [UIFont boldSystemFontOfSize:X]

//16进制的颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//图片
#define ImageWithFile(name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]])
#define ImageNamed(name) [UIImage imageNamed:name]

//关于坐标
#define  Center_x(w) (ScreenWidth-w)/2.0  //控件宽度w，控件水平居中位置的x
#define  Center_y(h, super_h)  (super_h-h)/2  //控件高度，控件垂直居位置的y

//计算相邻坐标
#define Right_X(view)  (view.frame.origin.x + view.frame.size.width)  //view右侧边缘的x坐标
#define Down_Y(view)  (view.frame.origin.y + view.frame.size.height)  //view下方边缘的y坐标

//应用版本
#define  App_Version  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

//系统版本
#define  IOS_Version  [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemVersion]]

//从后台取数据时转为string格式
#define Str(str) (str ? [NSString stringWithFormat:@"%@", str] : nil)

#endif






