//
//  LXLoopTemperatureViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/1.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoopTemperatureViewModel.h"
#import "LXLoginDataService.h"

@implementation LXLoopTemperatureViewModel

- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService uploadTemperature:array withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}
@end
