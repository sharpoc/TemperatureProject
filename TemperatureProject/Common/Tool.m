//
//  Tool.m
//  TemperatureProject
//
//  Created by admin on 2020/6/16.
//  Copyright © 2020 admin. All rights reserved.
//

#import "Tool.h"

@implementation Tool


+ (nullable NSString *)localTimeZoneStringDate:(nonnull NSDate *)date andFormatter:(nullable NSString *)formatter {
    NSString *result = @"";
    NSString *strFormatter = @"yyyy-MM-dd HH:mm";
    
    if (formatter.length != 0)
    {
        strFormatter = formatter;
    }
    
    //使用dataFormatter进行时间的设置
    NSDateFormatter *formetter = [[NSDateFormatter alloc] init];
    formetter.timeZone = [NSTimeZone localTimeZone];
    [formetter setDateFormat:strFormatter];
    result = [formetter stringFromDate:date];
    
    //返回设置好的时间字符串格式
    return result;
}
@end
