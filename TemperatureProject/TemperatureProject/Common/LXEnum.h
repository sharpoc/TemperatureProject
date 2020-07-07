//
//  LXEnum.h
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#ifndef LXEnum_h
#define LXEnum_h

typedef NS_ENUM(NSUInteger, SQSettingItemType) {
    SQSettingItemTypeAdmin,             /// 账户管理
    SQSettingItemTypeUserName,          /// 用户管理
    SQSettingItemTypePassWrod,          /// 修改密码
    SQSettingItemTypeHelp,              /// 帮助
    SQSettingItemTypeGroupAdmin,        /// 群管理
    SQSettingItemTypeDeviceAdmin,       /// 设备管理
    SQSettingItemTypePoliceAdmin        /// 报警管理
};

#endif /* LXEnum_h */
