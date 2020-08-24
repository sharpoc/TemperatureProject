//
//  LXHomeViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/8/24.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXHomeViewModel : NSObject

- (void)uploadTemperature:(NSArray *)array withBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

- (void)getDeviceListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

@end

NS_ASSUME_NONNULL_END
