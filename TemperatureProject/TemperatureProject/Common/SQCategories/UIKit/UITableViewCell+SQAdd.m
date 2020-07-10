//
//  UITableViewCell+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/19.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "UITableViewCell+SQAdd.h"

@implementation UITableViewCell (SQAdd)

+ (UINib *)sq_loadFromNib
{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

+ (NSString *)sq_identifier
{
    return NSStringFromClass([self class]);
}
@end
