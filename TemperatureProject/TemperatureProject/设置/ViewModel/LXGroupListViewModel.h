//
//  LXGroupListViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXGroupListViewModel : NSObject

- (void)getGroupListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *list))block;

@end

NS_ASSUME_NONNULL_END
