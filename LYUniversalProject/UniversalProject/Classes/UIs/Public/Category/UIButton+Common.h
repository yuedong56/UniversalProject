//
//  UIButton+Common.h
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)

+ (UIButton *)buttonWithFrame:(CGRect)frame
                   buttonType:(UIButtonType)buttonType;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                         font:(UIFont *)font;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)color
               highlightColor:(UIColor *)highlightColor;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName
             highlightImgName:(NSString *)highlightImgName;

@end
