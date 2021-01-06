//
//  LXURLHandler.m
//  TemperatureProject
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXURLHandler.h"

@implementation LXURLHandler

+ (NSString *)formateURL:(NSString *)subURL {
    NSString *finalURL = @"";
    finalURL = [NSString stringWithFormat:@"%@%@", [self getBaseURL], subURL];
    return finalURL;
}

+ (NSString *)getBaseURL {
    
    return @"http://112.21.182.154/";
}
@end
