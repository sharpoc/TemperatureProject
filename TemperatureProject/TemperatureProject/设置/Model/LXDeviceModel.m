//
//  LXDeviceModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceModel.h"

@implementation LXDeviceModel

+ (NSDictionary *)modelCustomPropertyMapper {
   // 将personId映射到key为id的数据字段
    return @{@"d_id":@"id"};
   // 映射可以设定多个映射字段
   //  return @{@"personId":@[@"id",@"uid",@"ID"]};
}
@end
