//
//  LXHistoryTemperatureViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXHistoryTemperatureViewModel : NSObject

- (void)getHistoryData:(NSString *)mac page:(NSInteger)page size:(NSInteger)size withBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block;

@end

NS_ASSUME_NONNULL_END
