//
//  LXLoginDataService.h
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXUserRegisterModel;
@class LXDeviceModel;
@class LXUserTokenModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXLoginDataService : NSObject

+ (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,LXUserTokenModel *model))block;

+ (void)sendYzmPhone:(NSString *)phone WithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)registerWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)findPwdWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)updateNameWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)addDevice:(LXDeviceModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)getHistoryData:(NSString *)mac page:(NSInteger)page size:(NSInteger)size withBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

+ (void)addGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

+ (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

+ (void)delDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

+ (void)updateDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

+ (void)getGroupListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *list))block;
@end

NS_ASSUME_NONNULL_END
