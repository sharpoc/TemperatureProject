//
//  LXUpdateUserNameViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXUserRegisterModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXUpdateUserNameViewModel : NSObject

- (void)updateNameWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;
@end

NS_ASSUME_NONNULL_END
