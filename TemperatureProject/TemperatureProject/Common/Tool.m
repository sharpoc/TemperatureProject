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

/**
 默认播放bound中的音效
 */
+ (void)playSound{
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"alarm_d_d.mp3" withExtension:nil];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    //3.播放音效文件
    AudioServicesPlaySystemSound(soundID);
}

+ (NSString*)convertToJSONData:(id)infoDict {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}
@end
