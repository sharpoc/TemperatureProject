//
//  LXGroupItemTableViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXGroupItemModel;
NS_ASSUME_NONNULL_BEGIN

@interface LXGroupItemTableViewCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) LXGroupItemModel *model;

@property (nonatomic,copy) void(^clickBlock)(LXGroupItemModel *model);
@end

NS_ASSUME_NONNULL_END
