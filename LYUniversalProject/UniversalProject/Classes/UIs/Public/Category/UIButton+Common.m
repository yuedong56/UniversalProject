//
//  UIButton+Common.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

+ (UIButton *)buttonWithFrame:(CGRect)frame
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame buttonType:(UIButtonType)buttonType
{
    UIButton *btn = [UIButton buttonWithType:buttonType];
    btn.frame = frame;
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                         font:(UIFont *)font
{
    UIButton *btn = [UIButton buttonWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)color
               highlightColor:(UIColor *)highlightColor
{
    UIButton *btn = [UIButton buttonWithFrame:frame title:title font:font];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:highlightColor forState:UIControlStateHighlighted];
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                      imgName:(NSString *)imgName
             highlightImgName:(NSString *)highlightImgName
{
    UIButton *btn = [UIButton buttonWithFrame:frame];
    if (imgName)          [btn setImage:[UIImage imageNamed:imgName]
                               forState:UIControlStateNormal];
    if (highlightImgName) [btn setImage:[UIImage imageNamed:highlightImgName]
                               forState:UIControlStateHighlighted];
    return btn;
}

@end


