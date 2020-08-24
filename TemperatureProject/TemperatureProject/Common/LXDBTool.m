//
//  LXDBTool.m
//  TemperatureProject
//
//  Created by admin on 2020/8/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDBTool.h"

@implementation LXDBTool


static LXDBTool *dbTool = nil;
+ (LXDBTool *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dbTool == nil) {
            dbTool = [[self alloc] init];
        }
    });
    return dbTool;
}

@end
