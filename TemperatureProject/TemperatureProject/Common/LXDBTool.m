//
//  LXDBTool.m
//  TemperatureProject
//
//  Created by admin on 2020/8/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDBTool.h"
#import "LXTemperatureModel.h"


@interface LXDBTool ()

@end

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

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.db = [JQFMDB shareDatabase:@"lxdata.sqlite"];
        [self.db jq_createTable:@"Temperature" dicOrModel:[LXTemperatureModel class]];
    }
    return self;
}

@end
