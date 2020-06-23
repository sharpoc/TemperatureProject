//
//  LoadingHUDManager.m
//  GuoBinTeam
//
//  Created by bing.li on 2017/3/10.
//  Copyright © 2017年 首汽约车. All rights reserved.
//

#import "LoadingHUDManager.h"
#import "MBProgressHUD.h"

@implementation LoadingHUDManager

//单例
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static LoadingHUDManager *hudManager = nil;
    dispatch_once(&onceToken, ^{
        hudManager = [[LoadingHUDManager alloc] init];
        hudManager.continueShow = NO;
    });
    return hudManager;
}

//显示加载提示
- (void)showHUDProgress {
    SQSafeMainDispatch(^{
        [self.hud showAnimated:YES];
        [self.hud hideAnimated:YES afterDelay:15];
        [KEYWINDOW addSubview:self.hud];
        
    });
}

//隐藏加载提示
- (void)hidHUDProgress {
    if(self.continueShow){
        return;
    }
    self.continueShow = NO;
    SQSafeMainDispatch(^{
        [self.hud hideAnimated:YES];
        [self.hud removeFromSuperview];
    });
}

//在指定view上显示加载提示
- (void)showHUDProgressInView:(UIView *)view{
    SQSafeMainDispatch(^{
        [self.hud showAnimated:YES];
        [view addSubview:self.hud];
    });
}

//懒加载
- (MBProgressHUD *)hud {

    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:KEYWINDOW];
    }
    
    return _hud;
}

@end
