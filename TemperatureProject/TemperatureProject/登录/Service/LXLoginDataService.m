//
//  LXLoginDataService.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginDataService.h"

@implementation LXLoginDataService

+ (void)sendYzmWithBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:@"18501302581" forKey:@"phone"];
    
    [LXHttpRequest POST:@"http://39.103.132.54:1111/accounts/api/app/sendCode" dict:dict succeed:^(id  _Nonnull data) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}



@end
