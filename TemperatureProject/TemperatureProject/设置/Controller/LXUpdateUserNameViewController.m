//
//  LXUpdateUserNameViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXUpdateUserNameViewController.h"
#import "LXUpdateUserNameViewModel.h"
#import "LXUserTokenModel.h"
#import "LXUserRegisterModel.h"
#import "LXUserTokenModel.h"

@interface LXUpdateUserNameViewController ()

@property (nonatomic,strong) LXUpdateUserNameViewModel *viewModel;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *commitButton;
@property (nonatomic,strong) UITextField *textField;
@end

@implementation LXUpdateUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KSQColor(187, 222, 214);
    // Do any additional setup after loading the view.
    [self createUI];
    [self createLayout];
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    self.textField.text = loginModel.user.cname;

}


- (void)createUI {
    
    [self.view addSubview:self.textField];
    [self.navView addSubview:self.commitButton];
}

- (void)createLayout {
    
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.navView.mas_bottom).offset(20);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(50);
    }];
}

- (void)commitButtonClick {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    LXUserRegisterModel *registerModel = [[LXUserRegisterModel alloc] init];
    registerModel.phone = loginModel.user.phone;
    registerModel.cname = self.textField.text;
    [self.viewModel updateNameWithModel:registerModel andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        if (success) {
            
            [LXTostHUD showTitle:msg];
        }
    }];

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
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 20;
        _textField.layer.masksToBounds = YES;
    }
    
    return _textField;
}

- (UIButton *)commitButton {
    
    if (!_commitButton) {
        
        _commitButton = [[UIButton alloc] init];
        _commitButton.backgroundColor = [UIColor clearColor];
        [_commitButton setTitle:@"完成" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _commitButton;
}

@end
