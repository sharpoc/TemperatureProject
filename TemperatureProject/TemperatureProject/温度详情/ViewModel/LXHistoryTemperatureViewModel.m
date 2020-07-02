//
//  LXHistoryTemperatureViewModel.m
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHistoryTemperatureViewModel.h"
#import "LXLoginDataService.h"

@implementation LXHistoryTemperatureViewModel

- (void)getHistoryData:(NSString *)mac page:(NSInteger)page size:(NSInteger)size withBlock:(void(^)(BOOL success,NSString *msg,NSArray *model))block {
    

    [LXLoginDataService getHistoryData:mac page:page size:size withBlock:^(BOOL success, NSString * _Nonnull msg, NSArray * _Nonnull model) {
       
        SQSafeBlock(block,success,msg,model);
    }];
}

@end
