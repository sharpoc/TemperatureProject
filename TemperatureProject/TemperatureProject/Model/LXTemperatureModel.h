//
//  LXTemperatureModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXTemperatureModel : NSObject

@property (nonatomic,copy) NSString *deviceId;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *recordTime;
@property (nonatomic,copy) NSString *temperature;

@end

NS_ASSUME_NONNULL_END
