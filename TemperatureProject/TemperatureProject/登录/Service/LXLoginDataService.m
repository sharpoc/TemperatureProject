//
//  LXLoginDataService.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginDataService.h"
#import "LXUserRegisterModel.h"
#import "LXDeviceModel.h"
#import "LXUserTokenModel.h"
#import "LXTemperatureModel.h"
#import "LXHistoryTemperatureModel.h"

@implementation LXLoginDataService

+ (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,LXUserTokenModel *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.phone forKey:@"phone"];
    [dict setObject:model.pwd forKey:@"password"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/login" jsonDict:dict succeed:^(id  _Nonnull data) {
        
        NSDictionary *dict = [data valueForKey:@"data"];
        LXUserTokenModel *userModel = [LXUserTokenModel yy_modelWithJSON:dict];
        SQSafeBlock(block,YES,@"",userModel);
    } failure:^(NSError * _Nonnull error) {
        SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)sendYzmPhone:(NSString *)phone WithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:phone forKey:@"phone"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/sendCode" jsonDict:dict succeed:^(id  _Nonnull data) {
        
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
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
        
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
        
        if ([code isEqualToString:@"0"]) {
            
            SQSafeBlock(block,YES,msg,nil);
        } else {
            
            SQSafeBlock(block,YES,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {
        
        SQSafeBlock(block,YES,@"",nil);
    }];
}

+ (void)addDevice:(LXDeviceModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.deviceId forKey:@"deviceId"];
    [dict setObject:model.phone forKey:@"phone"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/addDevice" jsonDict:dict succeed:^(id  _Nonnull data) {
           
           NSString *code = [data valueForKey:@"code"];
           NSString *msg = [data valueForKey:@"message"];
           
           if ([code isEqualToString:@"0"]) {
               
               SQSafeBlock(block,YES,msg,nil);
           } else {
               
               SQSafeBlock(block,NO,msg,nil);
           }
    } failure:^(NSError * _Nonnull error) {
           
           SQSafeBlock(block,YES,@"",nil);
    }];
    
}

+ (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (LXTemperatureModel *model in array) {
       
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setObject:model.deviceId forKey:@"deviceId"];
        [dict setObject:model.name forKey:@"name"];
        [dict setObject:model.phone forKey:@"phone"];
        [dict setObject:model.recordTime forKey:@"recordTime"];
        [dict setObject:model.temperature forKey:@"temperature"];
        [tempArr addObject:dict];
        
    }

    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/uploadTemperature" jsonDict:tempArr succeed:^(id  _Nonnull data) {
           
           NSString *code = [data valueForKey:@"code"];
           NSString *msg = [data valueForKey:@"message"];
           
           if ([code isEqualToString:@"0"]) {
               
               SQSafeBlock(block,YES,msg,nil);
           } else {
               
               SQSafeBlock(block,NO,msg,nil);
           }
    } failure:^(NSError * _Nonnull error) {
           
           SQSafeBlock(block,YES,@"",nil);
    }];
}

+ (void)getHistoryData:(NSString *)mac page:(NSInteger)page size:(NSInteger)size withBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:mac forKey:@"deviceId"];
    [dict setObject:@(page) forKey:@"page"];
    [dict setObject:@(size) forKey:@"size"];

    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/temperature" jsonDict:dict succeed:^(id  _Nonnull data) {
           
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
        NSDictionary *dict = [data valueForKey:@"data"];
        NSArray *array = [NSArray yy_modelArrayWithClass:[LXHistoryTemperatureModel class] json:[dict valueForKey:@"content"]];
        
       if ([code isEqualToString:@"0"]) {
           
           SQSafeBlock(block,YES,msg,array);
       } else {
           
           SQSafeBlock(block,NO,msg,nil);
       }
    } failure:^(NSError * _Nonnull error) {
           
        SQSafeBlock(block,YES,@"",nil);
    }];
    
}

+ (void)findPwdWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.code forKey:@"code"];
    [dict setObject:model.pwd forKey:@"password"];
    [dict setObject:model.phone forKey:@"phone"];

    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/resetPassword" jsonDict:dict succeed:^(id  _Nonnull data) {
           
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];

        
       if ([code isEqualToString:@"0"]) {
           
           SQSafeBlock(block,YES,msg,nil);
       } else {
           
           SQSafeBlock(block,NO,msg,nil);
       }
    } failure:^(NSError * _Nonnull error) {
           
        SQSafeBlock(block,YES,@"",nil);
    }];
}

+ (void)updateNameWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:model.phone forKey:@"phone"];
    [dict setObject:model.cname forKey:@"cname"];


    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/updateCname" jsonDict:dict succeed:^(id  _Nonnull data) {

        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];


        if ([code isEqualToString:@"0"]) {

            SQSafeBlock(block,YES,msg,nil);
        } else {

            SQSafeBlock(block,NO,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {

        SQSafeBlock(block,YES,@"",nil);
    }];
}

+ (void)addGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:code forKey:@"code"];
    [dict setObject:loginModel.user.uid forKey:@"userId"];


    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/inAppGroup" jsonDict:dict succeed:^(id  _Nonnull data) {

        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];


        if ([code isEqualToString:@"0"]) {

            SQSafeBlock(block,YES,msg,nil);
        } else {

            SQSafeBlock(block,NO,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {

        SQSafeBlock(block,YES,@"",nil);
    }];
}


@end
