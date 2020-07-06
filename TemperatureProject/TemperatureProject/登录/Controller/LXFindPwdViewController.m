//
//  LXFindPwdViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/29.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXFindPwdViewController.h"
#import "LXInputView.h"
#import "LXFindPwdViewModel.h"
#import "LXUserRegisterModel.h"

@interface LXFindPwdViewController ()

@property (nonatomic,strong) LXInputView *phoneInputView;
@property (nonatomic,strong) LXInputView *codeInputView;
@property (nonatomic,strong) LXInputView *pwdInputView;
@property (nonatomic,strong) LXInputView *confirmPwdInputView;
@property (nonatomic,strong) UIButton *commitButton;
@property (nonatomic,strong) LXFindPwdViewModel *viewModel;
@property (nonatomic,strong) UIButton *getCodeBtn;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger timeNum;

@end

@implementation LXFindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = KSQRandomColor;
    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.phoneInputView];
    [self.view addSubview:self.codeInputView];
    [self.view addSubview:self.pwdInputView];
    [self.view addSubview:self.confirmPwdInputView];
    [self.view addSubview:self.commitButton];
    
    [self.codeInputView addSubview:self.getCodeBtn];
}

- (void)createLayout {
    
    [self.phoneInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(43);
        
    }];
    
    [self.codeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.phoneInputView.mas_bottom).offset(12);
        
    }];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    
    [self.pwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.codeInputView.mas_bottom).offset(12);
        
    }];
    
    [self.confirmPwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.phoneInputView.mas_left);
        make.right.mas_equalTo(self.phoneInputView.mas_right);
        make.height.mas_equalTo(self.phoneInputView.mas_height);
        make.top.mas_equalTo(self.pwdInputView.mas_bottom).offset(12);
        
    }];
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.confirmPwdInputView.mas_bottom).offset(20);
    }];
}

- (void)commitButtonClick {
    
    LXUserRegisterModel *userModel = [[LXUserRegisterModel alloc] init];
    userModel.phone = self.phoneInputView.text;
    userModel.code = self.codeInputView.text;
    userModel.pwd = self.pwdInputView.text;
    
    [self.viewModel findPwdWithModel:userModel andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        if (success) {
            
            
        }
    }];
}

- (void)getCodeBtnClick {
    
    NSString *phone = self.phoneInputView.text;
    [self.viewModel sendYZMPhpne:phone withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        if (success) {
            
            self.timeNum = 60;
            self.getCodeBtn.enabled = NO;
            [self timerStart];
        } else {
            
            
        }
        [LXTostHUD showTitle:msg];
       
    }];
}

- (void)timeScheduled {
    
    self.timeNum --;
    NSString *text = [NSString stringWithFormat:@"%@秒",@(self.timeNum)];
    [self.getCodeBtn setTitle:text forState:UIControlStateNormal];
    if (self.timeNum < 1) {
        
        self.getCodeBtn.enabled = YES;
        [self.getCodeBtn setTitle:@"" forState:UIControlStateNormal];
        [self timerStop];
    }
}

#pragma mark- 添加定时器
//启动定时器
- (void)timerStart
{
    [self timerStop];
    if (_timer == nil) {
        _timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeScheduled) userInfo:nil repeats:YES];
    }
}
//销毁定时器
- (void)timerStop
{
    if (_timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
        }
        _timer = nil;
    }
}

- (LXInputView *)phoneInputView {
    
    if (!_phoneInputView) {
        
        _phoneInputView = [[LXInputView alloc] init];
        _phoneInputView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneInputView.image = [UIImage imageNamed:@"registerPhone"];
        _phoneInputView.placeHolderText = @"手机号";

    }
    
    return _phoneInputView;
}

- (LXInputView *)codeInputView {
    
    if (!_codeInputView) {
        
        _codeInputView = [[LXInputView alloc] init];
        _codeInputView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        _codeInputView.image = [UIImage imageNamed:@"registerCode"];
        _codeInputView.placeHolderText = @"验证码";

    }
    
    return _codeInputView;
}

- (LXInputView *)pwdInputView {
    
    if (!_pwdInputView) {
        
        _pwdInputView = [[LXInputView alloc] init];
        _pwdInputView.image = [UIImage imageNamed:@"registerPwd"];
        _pwdInputView.placeHolderText = @"设置密码";
        _pwdInputView.inputTextField.secureTextEntry = YES;


    }
    
    return _pwdInputView;
}

- (LXInputView *)confirmPwdInputView {
    
    if (!_confirmPwdInputView) {
        
        _confirmPwdInputView = [[LXInputView alloc] init];
        _confirmPwdInputView.image = [UIImage imageNamed:@"registerPwd"];
        _confirmPwdInputView.placeHolderText = @"确认密码";
        _confirmPwdInputView.inputTextField.secureTextEntry = YES;


    }
    
    return _confirmPwdInputView;
}

- (UIButton *)commitButton {
    
    if (!_commitButton) {
        
        _commitButton = [[UIButton alloc] init];
        _commitButton.backgroundColor = KSQRandomColor;
        [_commitButton addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_commitButton setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        _commitButton.layer.cornerRadius = 25;
        _commitButton.layer.masksToBounds = YES;
        
    }
    
    return _commitButton;
}

- (UIButton *)getCodeBtn {
    
    if (!_getCodeBtn) {
        
        _getCodeBtn = [[UIButton alloc] init];
        _getCodeBtn.backgroundColor = KSQRandomColor;
        [_getCodeBtn addTarget:self action:@selector(getCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _getCodeBtn;
}

- (LXFindPwdViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXFindPwdViewModel alloc] init];
    }
    
    return _viewModel;
}


@end
