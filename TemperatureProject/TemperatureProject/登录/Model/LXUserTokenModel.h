//
//  LXUserModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXUserModel : NSObject
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *username;
@end

@interface LXUserTokenModel : NSObject

@property (nonatomic,copy) NSString *token;

@property (nonatomic,strong) LXUserModel *user;


@end



NS_ASSUME_NONNULL_END
