//
//  LXLoginViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/22.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoginViewController.h"
#import "LXLoginViewModel.h"
#import "LXRegisterViewController.h"

@interface LXLoginViewController ()

@property (nonatomic,strong) LXLoginViewModel *viewModel;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UITextField *phone;

@end

@implementation LXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LXRegisterViewController *registerVc = [[LXRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
    

}


- (LXLoginViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXLoginViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
