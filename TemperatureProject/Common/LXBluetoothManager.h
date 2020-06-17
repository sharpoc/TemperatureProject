//
//  LXBluetoothManager.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBPeripheral;
NS_ASSUME_NONNULL_BEGIN

@protocol LXBluetoothManagerDelegate <NSObject>

- (void)dataWithBluetoothDic:(NSMutableDictionary *)dict;

- (void)didConnectBlue;

//测量温度完成
- (void)temperatureComplete:(double)numValue;

@end

@interface LXBluetoothManager : NSObject


@property (nonatomic,weak) id<LXBluetoothManagerDelegate> delegate;

- (void)start;

- (void)connect:(CBPeripheral *)peripheral;

@end

NS_ASSUME_NONNULL_END
