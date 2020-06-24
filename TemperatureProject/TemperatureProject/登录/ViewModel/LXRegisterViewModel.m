//
//  LXRegisterViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/6/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXRegisterViewModel.h"
#import "LXLoginDataService.h"

@implementation LXRegisterViewModel

- (void)sendYZM:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService sendYzmWithBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
    }];
}

- (void)registerWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService registerWithModel:model andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
    }];
}
@end
