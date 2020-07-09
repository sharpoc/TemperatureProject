//
//  LXSettingViewController.h
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXSettingItemModel;

@interface LXSettingViewController : LXBaseViewController

@property (nonatomic,copy) NSArray<LXSettingItemModel *> *lists;
@end


