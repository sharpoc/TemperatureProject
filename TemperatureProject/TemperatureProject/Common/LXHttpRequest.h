//
//  LXHttpRequest.h
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXHttpRequest : NSObject

+ (LXHttpRequest *)sharedInstance;
  
+ (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
  
+ (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
