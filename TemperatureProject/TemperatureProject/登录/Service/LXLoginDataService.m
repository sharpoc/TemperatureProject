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
#import "LXDeviceModel.h"
#import "LXGroupItemModel.h"

@implementation LXLoginDataService

+ (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,LXUserTokenModel *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:model.phone]  forKey:@"phone"];
    [dict setObject:[NSString sq_safeString:model.pwd] forKey:@"password"];
    
    [LXHttpRequest POST:GetURL(URL_login) jsonDict:dict succeed:^(id  _Nonnull data) {
        
        NSDictionary *dict = [data valueForKey:@"data"];
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
        if ([code isEqualToString:@"0"]) {
            
            LXUserTokenModel *userModel = [LXUserTokenModel yy_modelWithJSON:dict];
            userModel.user.pwd = model.pwd;
             SQSafeBlock(block,YES,msg,userModel);
        } else {
            
             SQSafeBlock(block,NO,msg,nil);
        }
    
       
    } failure:^(NSError * _Nonnull error) {
        SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)sendYzmPhone:(NSString *)phone WithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:phone] forKey:@"phone"];
    
    [LXHttpRequest POST:GetURL(URL_sendCode) jsonDict:dict succeed:^(id  _Nonnull data) {
        
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
    [dict setObject:[NSString sq_safeString:model.phone] forKey:@"phone"];
    [dict setObject:[NSString sq_safeString:model.code] forKey:@"code"];
    [dict setObject:[NSString sq_safeString:model.pwd] forKey:@"password"];
    [dict setObject:[NSString sq_safeString:model.userName] forKey:@"username"];
    [dict setObject:[NSString sq_safeString:model.cname] forKey:@"cname"];
    
    
    [LXHttpRequest POST:GetURL(URL_userRegister) jsonDict:dict succeed:^(id  _Nonnull data) {
        
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
    [dict setObject:[NSString sq_safeString:model.deviceId] forKey:@"deviceId"];
    [dict setObject:[NSString sq_safeString:model.phone] forKey:@"phone"];
    
    [LXHttpRequest POST:GetURL(URL_addDevice) jsonDict:dict succeed:^(id  _Nonnull data) {
           
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
        [dict setObject:[NSString sq_safeString:model.deviceId] forKey:@"deviceId"];
        [dict setObject:[NSString sq_safeString:model.name] forKey:@"name"];
        [dict setObject:[NSString sq_safeString:model.phone] forKey:@"phone"];
        [dict setObject:[NSString sq_safeString:model.recordTime] forKey:@"recordTime"];
        [dict setObject:[NSString sq_safeString:model.temperature] forKey:@"temperature"];
        [tempArr addObject:dict];
        
    }

    
    [LXHttpRequest POST:GetURL(URL_uploadTemperature) jsonDict:tempArr succeed:^(id  _Nonnull data) {
           
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
    [dict setObject:[NSString sq_safeString:mac] forKey:@"deviceId"];
    [dict setObject:@(page) forKey:@"page"];
    [dict setObject:@(size) forKey:@"size"];

    
    [LXHttpRequest POST:GetURL(URL_temperature) jsonDict:dict succeed:^(id  _Nonnull data) {
           
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
    [dict setObject:[NSString sq_safeString:model.code] forKey:@"code"];
    [dict setObject:[NSString sq_safeString:model.pwd] forKey:@"password"];
    [dict setObject:[NSString sq_safeString:model.phone] forKey:@"phone"];

    
    [LXHttpRequest POST:GetURL(URL_resetPassword) jsonDict:dict succeed:^(id  _Nonnull data) {
           
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
    [dict setObject:[NSString sq_safeString:model.phone] forKey:@"phone"];
    [dict setObject:[NSString sq_safeString:model.cname] forKey:@"cname"];


    [LXHttpRequest POST:GetURL(URL_updateCname) jsonDict:dict succeed:^(id  _Nonnull data) {

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
    [dict setObject:[NSString sq_safeString:code] forKey:@"code"];
    [dict setObject:[NSString sq_safeString:loginModel.user.uid] forKey:@"userId"];
    
    
    [LXHttpRequest POST:GetURL(URL_inAppGroup) jsonDict:dict succeed:^(id  _Nonnull data) {
        
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

+ (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:loginModel.user.uid] forKey:@"userId"];
    
    [LXHttpRequest GET:GetURL(URL_getDevice) dict:dict succeed:^(id  _Nonnull data) {
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
        NSDictionary *dict = [data valueForKey:@"data"];
        NSArray *array = [NSArray yy_modelArrayWithClass:[LXDeviceModel class] json:dict];

        if ([code isEqualToString:@"0"]) {

           SQSafeBlock(block,YES,msg,array);
        } else {

           SQSafeBlock(block,NO,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {
        
        SQSafeBlock(block,YES,@"",nil);
    }];

}

+ (void)delDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:loginModel.user.phone] forKey:@"phone"];
    [dict setObject:[NSString sq_safeString:model.deviceId] forKey:@"deviceId"];
    
    
    [LXHttpRequest POST:GetURL(URL_removeDevice) jsonDict:dict succeed:^(id  _Nonnull data) {
        
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

+ (void)updateDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:model.name] forKey:@"name"];
    [dict setObject:[NSString sq_safeString:model.deviceId] forKey:@"deviceId"];
    
    
    [LXHttpRequest POST:GetURL(URL_updateDevice) jsonDict:dict succeed:^(id  _Nonnull data) {
        
        NSString *code = [data valueForKey:@"code"];
        NSString *msg = [data valueForKey:@"message"];
        
        
        if ([code isEqualToString:@"0"]) {
            
            SQSafeBlock(block,YES,msg,nil);
        } else {
            
            SQSafeBlock(block,NO,msg,nil);
        }
    } failure:^(NSError * _Nonnull error) {

        SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)getGroupListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *list))block {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:loginModel.user.phone] forKey:@"phone"];
    [LXHttpRequest GET:GetURL(URL_getGroupList) dict:dict succeed:^(id  _Nonnull data) {
        
        NSArray *dicts = [data valueForKey:@"content"];
        NSArray *array = [NSArray yy_modelArrayWithClass:[LXGroupItemModel class] json:dicts];
        if (array.count > 0) {
            
            SQSafeBlock(block,YES,@"",array);
        } else {
            
            SQSafeBlock(block,NO,@"",nil);
        }
        
    } failure:^(NSError * _Nonnull error) {
        
         SQSafeBlock(block,NO,@"",nil);
    }];
}

+ (void)outGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:[NSString sq_safeString:code] forKey:@"code"];
    [dict setObject:[NSString sq_safeString:loginModel.user.uid] forKey:@"userId"];
    
    
    [LXHttpRequest POST:GetURL(URL_quitGroup) jsonDict:dict succeed:^(id  _Nonnull data) {
        
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
