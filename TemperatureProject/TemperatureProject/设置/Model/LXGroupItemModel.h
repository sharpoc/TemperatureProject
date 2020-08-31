//
//  LXGroupItemModel.h
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXGroupItemModel : NSObject

@property (nonatomic,copy) NSString *code;
@property (nonatomic,assign) NSInteger gid;
@property (nonatomic,copy) NSString *createBy;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *contact;

@end

NS_ASSUME_NONNULL_END
