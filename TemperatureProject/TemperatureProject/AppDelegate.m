//
//  AppDelegate.m
//  TemperatureProject
//
//  Created by admin on 2020/6/11.
//  Copyright © 2020 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "LXHomeViewController.h"
#import "LXWelcomeViewController.h"
#import "LXLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
      // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    //创建控制器
    LXLoginViewController *controller=[[LXLoginViewController alloc]init];
    
    LXWelcomeViewController *welcomeVC = [[LXWelcomeViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:welcomeVC];
    //设置控制器View的背景颜色
    controller.view.backgroundColor = [UIColor brownColor];
    //设置该控制器为Window的根控制器
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
