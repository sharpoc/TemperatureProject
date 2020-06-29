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

+ (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.phone forKey:@"phone"];
    [dict setObject:model.pwd forKey:@"password"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/login" jsonDict:dict succeed:^(id  _Nonnull data) {
        
        SQSafeBlock(block,YES,@"",nil);
    } failure:^(NSError * _Nonnull error) {
        SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)sendYzmPhone:(NSString *)phone WithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:phone forKey:@"phone"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/sendCode" jsonDict:dict succeed:^(id  _Nonnull data) {
        
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"data"];
        if ([code isEqualToString:@"0"]) {
            
            SQSafeBlock(block,YES,msg,nil);
        } else {
            
            SQSafeBlock(block,YES,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {
        
        SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)registerWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.phone forKey:@"phone"];
    [dict setObject:model.code forKey:@"code"];
    [dict setObject:model.pwd forKey:@"password"];
    [dict setObject:model.userName forKey:@"username"];
    [dict setObject:model.cname forKey:@"cname"];
    
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/userRegister" jsonDict:dict succeed:^(id  _Nonnull data) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}



@end
