//
//  LXLoginViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginViewModel.h"
#import "LXLoginDataService.h"

@implementation LXLoginViewModel

- (void)sendYZM:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService sendYzmWithBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
    }];
}
@end
