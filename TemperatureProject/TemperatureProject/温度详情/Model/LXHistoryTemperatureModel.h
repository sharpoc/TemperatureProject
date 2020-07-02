//
//  LXHistoryTemperatureModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXHistoryTemperatureModel : NSObject

@property (nonatomic,copy) NSString *idCard;
@property (nonatomic,copy) NSString *deviceId;
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *d_id;
@property (nonatomic,copy) NSString *temperature;
@property (nonatomic,copy) NSString *recordTime;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *createTime;

@end

NS_ASSUME_NONNULL_END
