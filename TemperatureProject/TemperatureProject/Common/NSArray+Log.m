//
//  NSArray+Log.m
//  TemperatureProject
//
//  Created by admin on 2020/6/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSString *desc = [self.description stringByReplacingOccurrencesOfString:@"\\\"" withString:@"ms_desc_value_str1"];
    desc = [desc stringByReplacingOccurrencesOfString:@"\\n" withString:@"ms_desc_value_str2"];
    desc = [desc stringByReplacingOccurrencesOfString:@"\\r" withString:@"ms_desc_value_str3"];
    desc = [desc stringByReplacingOccurrencesOfString:@"\"" withString:@"ms_desc_value_str4"];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    desc = [desc stringByReplacingOccurrencesOfString:@"ms_desc_value_str1" withString:@"\""];
    desc = [desc stringByReplacingOccurrencesOfString:@"ms_desc_value_str2" withString:@"\n"];
    desc = [desc stringByReplacingOccurrencesOfString:@"ms_desc_value_str3" withString:@"\r"];
    return [desc stringByReplacingOccurrencesOfString:@"ms_desc_value_str4" withString:@"\""];
}
@end
