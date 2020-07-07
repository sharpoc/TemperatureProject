//
//  LXSettingItemModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXSettingItemModel : NSObject

@property (nonatomic,copy) NSString *iconText;
@property (nonatomic,copy) NSString *titleText;
@property (nonatomic,assign) SQSettingItemType itemType;

@end

NS_ASSUME_NONNULL_END
