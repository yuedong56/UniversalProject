//
//  UIViewController+Helper.m
//  四中网校-ios
//
//  Created by 老岳 on 14-4-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "UIViewController+Helper.h"

@implementation UIViewController (Helper)

//ios5.X
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//ios6.X and later
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
