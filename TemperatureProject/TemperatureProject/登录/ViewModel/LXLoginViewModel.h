//
//  LXLoginViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXUserRegisterModel;
@class LXUserTokenModel;
NS_ASSUME_NONNULL_BEGIN

@interface LXLoginViewModel : NSObject

- (void)loginWithModel:(LXUserRegisterModel *)model withBlock:(void(^)(BOOL success,NSString *msg,LXUserTokenModel *model))block;
@end

NS_ASSUME_NONNULL_END
