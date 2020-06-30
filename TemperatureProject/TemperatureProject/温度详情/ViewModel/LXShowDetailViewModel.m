//
//  LXShowDetailViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/6/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXShowDetailViewModel.h"
#import "LXLoginDataService.h"

@implementation LXShowDetailViewModel

- (void)addDevice:(LXDeviceModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService addDevice:model withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}

- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService uploadTemperature:array withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}
@end
