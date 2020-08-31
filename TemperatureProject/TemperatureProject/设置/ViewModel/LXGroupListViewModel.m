//
//  LXGroupListViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXGroupListViewModel.h"
#import "LXLoginDataService.h"

@implementation LXGroupListViewModel

- (void)getGroupListWithBlock:(void(^)(BOOL success,NSString *msg,NSArray *list))block {
    
    [LXLoginDataService getGroupListWithBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull list) {
    
        SQSafeBlock(block,success,msg,list);
    }];
    
}

- (void)outGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService outGroupWithCode:code andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,nil);
    }];
}
@end
