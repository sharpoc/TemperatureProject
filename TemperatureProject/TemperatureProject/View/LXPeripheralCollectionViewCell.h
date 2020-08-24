//
//  LXPeripheralCollectionViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXPeripheral;
NS_ASSUME_NONNULL_BEGIN

@interface LXPeripheralCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) LXPeripheral *peripheral;
@property (nonatomic,copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
