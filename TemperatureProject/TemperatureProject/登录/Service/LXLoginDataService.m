//
//  LXLoginDataService.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginDataService.h"
#import "LXUserRegisterModel.h"

@implementation LXLoginDataService

+ (void)sendYzmWithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:@"18501302581" forKey:@"phone"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/sendCode" dict:dict succeed:^(id  _Nonnull data) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

+ (void)registerWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.phone forKey:@"phone"];
    [dict setObject:model.code forKey:@"code"];
    [dict setObject:model.pwd forKey:@"password"];
    [dict setObject:model.userName forKey:@"username"];
    
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/userRegiste" dict:dict succeed:^(id  _Nonnull data) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}



@end
