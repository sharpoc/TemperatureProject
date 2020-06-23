//
//  Tool.h
//  TemperatureProject
//
//  Created by admin on 2020/6/16.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

+ (nullable NSString *)localTimeZoneStringDate:(nonnull NSDate *)date andFormatter:(nullable NSString *)formatter;

+ (void)playSound;
@end

NS_ASSUME_NONNULL_END
