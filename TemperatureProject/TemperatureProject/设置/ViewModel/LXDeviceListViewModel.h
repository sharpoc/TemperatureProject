//
//  LXDeviceListViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXDeviceModel;
NS_ASSUME_NONNULL_BEGIN

@interface LXDeviceListViewModel : NSObject

- (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

- (void)delDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

- (void)updateDeviceWithMac:(LXDeviceModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

@end

NS_ASSUME_NONNULL_END
