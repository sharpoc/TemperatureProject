//
//  LXLoginViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginViewController.h"
#import "LXLoginViewModel.h"

@interface LXLoginViewController ()

@property (nonatomic,strong) LXLoginViewModel *viewModel;

@end

@implementation LXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.viewModel sendYZM:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
//        
//    }];
}


- (LXLoginViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXLoginViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
