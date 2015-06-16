//
//  UIImage+Helper.m
//  LYUniversalProject
//
//  Created by yuedongkui on 15/6/15.
//  Copyright (c) 2015年 老岳. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)

/** 按所给尺寸绘制图片 */
- (UIImage *)scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context，并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

@end
