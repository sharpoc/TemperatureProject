//
//  LXDeviceModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXDeviceModel : NSObject

@property (nonatomic,copy) NSString *deviceId;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *idCard;

@property (nonatomic,copy) NSString *d_id;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,assign) NSTimeInterval createTime;

@property (nonatomic,assign) NSTimeInterval bindTime;

@property (nonatomic,copy) NSString *phone;

@end

NS_ASSUME_NONNULL_END
