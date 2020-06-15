//
//  LXMacro.h
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#define IS_IPHONEX isIPhoneX()
#define IPHONE_X_Gap (IS_IPHONEX ? 24 : 0)
#define Height (IS_IPHONEX ? ([[UIScreen mainScreen] bounds].size.height-20):([[UIScreen mainScreen] bounds].size.height))
#define BottomGap (IS_IPHONEX ? 34 : 0)
#define STATUS_BAR_HEIGHT (SQRealStatusBarHeight())
//首页页面顶部的距离
#define KPageTopGap (SQRealStatusBarHeight()+44.0+44.0)

#define kNavigationBarHeight (SQRealStatusBarHeight()+44.0)

//屏幕宽高 (portrait)
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
//颜色
#define KSQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KSQRandomColor KSQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//屏幕宽高 (portrait)
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

static inline BOOL isIPhoneX() {
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneX;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            
            iPhoneX = YES;
        }
    }
    
    return iPhoneX;
}

//获取导航栏的高度，不考虑状态栏隐藏的情况。状态栏隐藏的情况不要用这个值
static inline CGFloat SQRealNavigationBarHeight() {
    if (isIPhoneX()) {
        return 44.f+44.f;
    } else {
        return 20.f+44.f;
    }
}
//处理当进入App前和进入App后顶部有定位蓝条，打电话条，热点条等造成Appy下移问题
static inline CGFloat SQRealStatusBarHeight() {
    CGFloat systemBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    if (isIPhoneX()) {
        return systemBarHeight > 0 ? systemBarHeight : 44.f;
    } else {
        return (systemBarHeight > 20.f || systemBarHeight <= 0) ? 20.f : systemBarHeight;
    }
}
