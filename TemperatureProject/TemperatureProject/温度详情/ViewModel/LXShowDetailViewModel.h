//
//  LXShowDetailViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXDeviceModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXShowDetailViewModel : NSObject

- (void)addDevice:(LXDeviceModel *)model withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;
@end

NS_ASSUME_NONNULL_END
