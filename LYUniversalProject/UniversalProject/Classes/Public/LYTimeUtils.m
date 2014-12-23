//
//  LYTimeUtils.m
//  LYUniversalProject
//
//  Created by 老岳 on 14-12-23.
//  Copyright (c) 2014年 老岳. All rights reserved.
//

#import "LYTimeUtils.h"

@implementation LYTimeUtils

/** NSDate转为NSString */
+ (NSString *)stringFromDate:(NSDate *)date format:(DateFormat)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (dateFormat) {
        case DateFormatHourAll:
        {
            [dateFormatter setDateFormat:@"HH:mm:ss"];
        } break;
        case DateFormatHourMinute:
        {
            [dateFormatter setDateFormat:@"HH:mm"];
        } break;
        case DateFormatMinuteSecond:
        {
            [dateFormatter setDateFormat:@"mm:ss"];
        } break;
        case DateFormatMonth:
        {
            [dateFormatter setDateFormat:@"MM-dd"];
        } break;
        case DateFormatYear:
        {
            [dateFormatter setDateFormat:@"yyyy"];
        } break;
        default: break;
    }
    return [dateFormatter stringFromDate:date];
}

/** 将秒转为时间 XX：XX */
+ (NSString *)timeFormatted:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

@end


