//
//  UILabel+Common.h
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                    bgColor:(UIColor *)bgColor
                  alignment:(NSTextAlignment)alignment;

@end
