//
//  LXLoginViewModel.h
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXLoginViewModel : NSObject

- (void)sendYZM:(void(^)(BOOL success,NSString *msg,NSObject *model))block;
@end

NS_ASSUME_NONNULL_END
