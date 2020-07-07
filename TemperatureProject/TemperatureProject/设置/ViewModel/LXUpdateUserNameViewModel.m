//
//  LXUpdateUserNameViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXUpdateUserNameViewModel.h"
#import "LXLoginDataService.h"

@implementation LXUpdateUserNameViewModel


- (void)updateNameWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService updateNameWithModel:model andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}
@end
