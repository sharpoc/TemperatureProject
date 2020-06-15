//
//  LXShowDetailViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/15.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXShowDetailViewController.h"

@interface LXShowDetailViewController ()

@end

@implementation LXShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = KSQRandomColor;

}

- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}



@end
