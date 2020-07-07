//
//  LXSettingItemTableViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXSettingItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXSettingItemTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) LXSettingItemModel *model;

@end

NS_ASSUME_NONNULL_END
