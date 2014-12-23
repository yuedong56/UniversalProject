//
//  UILabel+Common.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                    bgColor:(UIColor *)bgColor
                  alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = bgColor;
    label.textAlignment = alignment;    
    return label;
}

@end
