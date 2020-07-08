//
//  LXDeviceListTableViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXDeviceModel;
NS_ASSUME_NONNULL_BEGIN

@protocol LXDeviceListTableViewCellDelegate <NSObject>

- (void)controlClick:(LXDeviceModel *)model;

- (void)infoClick:(LXDeviceModel *)model;

- (void)delClick:(LXDeviceModel *)model;

@end

@interface LXDeviceListTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) LXDeviceModel *model;

@property (nonatomic,weak) id<LXDeviceListTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
