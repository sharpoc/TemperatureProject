//
//  LXFindPwdViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LXUserRegisterModel;

NS_ASSUME_NONNULL_BEGIN

@interface LXFindPwdViewModel : NSObject

- (void)sendYZMPhpne:(NSString *)phone withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

- (void)findPwdWithModel:(LXUserRegisterModel *)model andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;


@end

NS_ASSUME_NONNULL_END
