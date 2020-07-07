//
//  LXAddGroupViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXAddGroupViewModel.h"
#import "LXLoginDataService.h"

@implementation LXAddGroupViewModel

- (void)addGroupWithCode:(NSString *)code andBlock:(void(^)(BOOL success,NSString *msg,NSObject *model))block {
    
    [LXLoginDataService addGroupWithCode:code andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}
@end
