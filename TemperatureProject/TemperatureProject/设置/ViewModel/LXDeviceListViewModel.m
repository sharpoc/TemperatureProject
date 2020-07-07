//
//  LXDeviceListViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceListViewModel.h"
#import "LXLoginDataService.h"

@implementation LXDeviceListViewModel

- (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    [LXLoginDataService getDeviceListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}
@end
