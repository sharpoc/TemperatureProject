//
//  LoadingHUDManager.h
//  GuoBinTeam
//
//  Created by bing.li on 2017/3/10.
//  Copyright © 2017年 首汽约车. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBProgressHUD;

@interface LoadingHUDManager : NSObject

@property(nonatomic, strong)MBProgressHUD *hud;

/**
 是否继续显示loading，为YES时，hidHUDProgress不起作用
 */
@property(nonatomic, assign)BOOL continueShow;
//单例
+ (instancetype)shareInstance;

//显示加载提示
- (void)showHUDProgress;

//隐藏加载提示
- (void)hidHUDProgress;

//在指定view上显示加载提示
- (void)showHUDProgressInView:(UIView *)view;

@end
