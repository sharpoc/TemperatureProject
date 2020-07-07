//
//  LXAddGroupViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXAddGroupViewModel : NSObject

- (void)addGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block;

@end

NS_ASSUME_NONNULL_END
