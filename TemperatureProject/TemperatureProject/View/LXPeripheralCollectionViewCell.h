//
//  LXPeripheralCollectionViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBPeripheral;
NS_ASSUME_NONNULL_BEGIN

@interface LXPeripheralCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) CBPeripheral *peripheral;

@end

NS_ASSUME_NONNULL_END
