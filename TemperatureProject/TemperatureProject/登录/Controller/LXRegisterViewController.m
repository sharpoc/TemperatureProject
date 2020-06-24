//
//  LXRegisterViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/23.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXRegisterViewController.h"
#import "LXInputView.h"

@interface LXRegisterViewController ()

@property (nonatomic,strong) LXInputView *phoneInputView;
@property (nonatomic,strong) LXInputView *codeInputView;
@property (nonatomic,strong) LXInputView *pwdInputView;
@property (nonatomic,strong) LXInputView *confirmPwdInputView;

@end

@implementation LXRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KSQRandomColor;
    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.phoneInputView];
    [self.view addSubview:self.codeInputView];
    [self.view addSubview:self.pwdInputView];
    [self.view addSubview:self.confirmPwdInputView];
}

- (void)createLayout {
    
    [self.phoneInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [self.codeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.phoneInputView.mas_bottom).offset(20);
    }];
    
    [self.pwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.codeInputView.mas_bottom).offset(20);
    }];
    
    [self.confirmPwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.pwdInputView.mas_bottom).offset(20);
    }];
}

- (LXInputView *)phoneInputView {
    
    if (!_phoneInputView) {
        
        _phoneInputView = [[LXInputView alloc] init];
        _phoneInputView.backgroundColor = KSQRandomColor;
    }
    
    return _phoneInputView;
}

- (LXInputView *)codeInputView {
    
    if (!_codeInputView) {
        
        _codeInputView = [[LXInputView alloc] init];
        _codeInputView.backgroundColor = KSQRandomColor;
    }
    
    return _codeInputView;
}

- (LXInputView *)pwdInputView {
    
    if (!_pwdInputView) {
        
        _pwdInputView = [[LXInputView alloc] init];
        _pwdInputView.backgroundColor = KSQRandomColor;
    }
    
    return _pwdInputView;
}

- (LXInputView *)confirmPwdInputView {
    
    if (!_confirmPwdInputView) {
        
        _confirmPwdInputView = [[LXInputView alloc] init];
        _confirmPwdInputView.backgroundColor = KSQRandomColor;
    }
    
    return _confirmPwdInputView;
}


@end
