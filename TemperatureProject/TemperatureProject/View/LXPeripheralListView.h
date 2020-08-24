//
//  LXPeripheralListView.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBPeripheral;
@class LXDeviceModel;
NS_ASSUME_NONNULL_BEGIN

@protocol LXPeripheralListViewDelegate <NSObject>

- (void)didItem:(CBPeripheral *)peripheral;

@end

@interface LXPeripheralListView : UIView

@property (nonatomic,copy) NSArray *peripheralArray;
@property (nonatomic,copy) NSArray<LXDeviceModel *> *deviceArray;
@property (nonatomic,weak) id<LXPeripheralListViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
