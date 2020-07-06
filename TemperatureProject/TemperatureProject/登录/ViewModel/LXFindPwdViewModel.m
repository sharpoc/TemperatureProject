//
//  LXFindPwdViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXFindPwdViewModel.h"
#import "LXLoginDataService.h"

@implementation LXFindPwdViewModel

- (void)sendYZMPhpne:(NSString *)phone withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService sendYzmPhone:phone WithBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}

- (void)findPwdWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService findPwdWithModel:model andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,model);
    }];
}

@end
