//
//  LXHomeViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/8/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHomeViewModel.h"
#import "LXLoginDataService.h"

@implementation LXHomeViewModel


- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService uploadTemperature:array withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}

- (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    [LXLoginDataService getDeviceListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}

@end
