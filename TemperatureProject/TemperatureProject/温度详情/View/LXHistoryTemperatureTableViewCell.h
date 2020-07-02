//
//  LXHistoryTemperatureTableViewCell.h
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXHistoryTemperatureModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXHistoryTemperatureTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) LXHistoryTemperatureModel *model;


@end

NS_ASSUME_NONNULL_END
