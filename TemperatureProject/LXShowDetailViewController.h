//
//  LXShowDetailViewController.h
//  TemperatureProject
//
//  Created by admin on 2020/6/15.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CBPeripheral;
@class LXBluetoothManager;

NS_ASSUME_NONNULL_BEGIN

@interface LXShowDetailViewController : UIViewController


@property (nonatomic,assign) double numValue;
@property (nonatomic,strong) LXBluetoothManager *bluetoothManager;
@property (nonatomic,strong) CBPeripheral *peripheral;


@end

NS_ASSUME_NONNULL_END
