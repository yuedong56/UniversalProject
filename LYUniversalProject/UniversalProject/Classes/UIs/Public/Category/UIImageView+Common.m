//
//  UIImageView+Common.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "UIImageView+Common.h"

@implementation UIImageView (Common)

+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                            imgName:(NSString *)imgName
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    imgView.image = [UIImage imageNamed:imgName];
    return imgView;
}

@end
