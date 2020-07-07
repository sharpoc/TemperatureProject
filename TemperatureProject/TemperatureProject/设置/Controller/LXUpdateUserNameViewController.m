//
//  LXUpdateUserNameViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXUpdateUserNameViewController.h"
#import "LXUpdateUserNameViewModel.h"

@interface LXUpdateUserNameViewController ()

@property (nonatomic,strong) LXUpdateUserNameViewModel *viewModel;
@property (nonatomic,strong) UITextField *textField;
@end

@implementation LXUpdateUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    
    
}

- (void)createLayout {
    
    
}

- (LXUpdateUserNameViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXUpdateUserNameViewModel alloc] init];
    }
    
    return _viewModel;
}


- (UITextField *)textField {
    
    if (!_textField) {
        
        _textField = [[UITextField alloc] init];
    }
    
    return _textField;
}

@end
