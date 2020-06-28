//
//  LXLoginViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginViewModel.h"
#import "LXLoginDataService.h"

@implementation LXLoginViewModel

- (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService loginWithModel:model withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        SQSafeBlock(block,success,msg,nil);
    }];
}
@end
