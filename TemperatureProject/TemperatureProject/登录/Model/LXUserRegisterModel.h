//
//  LXUserRegisterModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXUserRegisterModel : NSObject

@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *pwd;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *cname;
@end

NS_ASSUME_NONNULL_END
