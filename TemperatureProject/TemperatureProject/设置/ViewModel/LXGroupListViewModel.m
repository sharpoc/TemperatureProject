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
@end
