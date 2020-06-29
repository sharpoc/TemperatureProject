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

- (void)sendYZMPhpne:(NSString *)phone withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService sendYzmPhone:phone WithBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}

- (void)registerWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService registerWithModel:model andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
    }];
}
@end
