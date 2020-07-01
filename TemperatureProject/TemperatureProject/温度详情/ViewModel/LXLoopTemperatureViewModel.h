//
//  LXLoopTemperatureViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/1.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXLoopTemperatureViewModel : NSObject

- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

@end

NS_ASSUME_NONNULL_END
