//
//  LXRegisterViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/23.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXRegisterViewController.h"
#import "LXInputView.h"
#import "LXRegisterViewModel.h"
#import "LXUserRegisterModel.h"

@interface LXRegisterViewController ()

@property (nonatomic,strong) LXRegisterViewModel *viewModel;
@property (nonatomic,strong) UIImageView *logImageView;
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) LXInputView *userNameInputView;
@property (nonatomic,strong) LXInputView *phoneInputView;
@property (nonatomic,strong) LXInputView *codeInputView;
@property (nonatomic,strong) LXInputView *pwdInputView;
@property (nonatomic,strong) LXInputView *confirmPwdInputView;

@property (nonatomic,strong) UIButton *getCodeBtn;
@property (nonatomic,strong) UIButton *submitBtn;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger timeNum;


@end

@implementation LXRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.logImageView];
    [self.bgView addSubview:self.userNameInputView];
    [self.bgView addSubview:self.phoneInputView];
    [self.bgView addSubview:self.codeInputView];
    [self.bgView addSubview:self.pwdInputView];
    [self.bgView addSubview:self.confirmPwdInputView];
    
    [self.codeInputView addSubview:self.getCodeBtn];
    
    [self.view addSubview:self.submitBtn];
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(150);
    }];
    
    [self.logImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(110);
        make.top.mas_equalTo(self.bgView.mas_top).offset(-55);
        
    }];
    
    [self.userNameInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(65);
        make.height.mas_equalTo(43);
    }];
    
    [self.phoneInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.userNameInputView.mas_left);
        make.right.mas_equalTo(self.userNameInputView.mas_right);
        make.height.mas_equalTo(self.userNameInputView.mas_height);
        make.top.mas_equalTo(self.userNameInputView.mas_bottom).offset(12);
    }];
    
    [self.codeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.userNameInputView.mas_left);
        make.right.mas_equalTo(self.userNameInputView.mas_right);
        make.height.mas_equalTo(self.userNameInputView.mas_height);
        make.top.mas_equalTo(self.phoneInputView.mas_bottom).offset(12);
    }];
    
    [self.pwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.userNameInputView.mas_left);
        make.right.mas_equalTo(self.userNameInputView.mas_right);
        make.height.mas_equalTo(self.userNameInputView.mas_height);
        make.top.mas_equalTo(self.codeInputView.mas_bottom).offset(12);
    }];
    
    [self.confirmPwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.userNameInputView.mas_left);
        make.right.mas_equalTo(self.userNameInputView.mas_right);
        make.height.mas_equalTo(self.userNameInputView.mas_height);
        make.top.mas_equalTo(self.pwdInputView.mas_bottom).offset(12);
    }];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-2);
        make.top.mas_equalTo(2);
        make.bottom.mas_equalTo(-2);
        make.width.mas_equalTo(100);
    }];
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(self.confirmPwdInputView.mas_bottom).offset(20);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(-20);
    }];
}

- (void)getCodeBtnClick {
    
    NSString *phone = self.phoneInputView.text;
    [self.viewModel sendYZMPhpne:phone withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        if (success) {
            
            self.timeNum = 60;
            [self timerStart];
        } else {
            
            
        }
        [LXTostHUD showTitle:msg];
       
    }];
}

- (void)submitBtnClick {
    
    LXUserRegisterModel *userModel = [[LXUserRegisterModel alloc] init];
    userModel.phone = self.phoneInputView.text;
    userModel.code = self.codeInputView.text;
    userModel.pwd = self.pwdInputView.text;
    userModel.userName = self.phoneInputView.text;
    userModel.cname = self.userNameInputView.text;

    [self.viewModel registerWithModel:userModel andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        if (success) {
            
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
        
        self.getCodeBtn.enabled = NO;
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

- (LXRegisterViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXRegisterViewModel alloc] init];
    }
    
    return _viewModel;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.userInteractionEnabled = YES;
        _bgImageView.image = [UIImage imageNamed:@"loginBg"];
    }
    
    return _bgImageView;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 10;
        
    }
    
    return _bgView;
}

- (UIImageView *)logImageView {
    
    if (!_logImageView) {
        
        _logImageView = [[UIImageView alloc] init];
        _logImageView.backgroundColor = KSQColor(112, 233, 205);
        _logImageView.image = [UIImage imageNamed:@"logowz"];
        _logImageView.contentMode = UIViewContentModeCenter;
        _logImageView.layer.cornerRadius = 55;
        
    }
    
    return _logImageView;
}

- (LXInputView *)userNameInputView {
    
    if (!_userNameInputView) {
        
        _userNameInputView = [[LXInputView alloc] init];
        _userNameInputView.image = [UIImage imageNamed:@"registerName"];
        _userNameInputView.placeHolderText = @"用户名";

    }
    
    return _userNameInputView;
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

- (UIButton *)getCodeBtn {
    
    if (!_getCodeBtn) {
        
        _getCodeBtn = [[UIButton alloc] init];
        _getCodeBtn.backgroundColor = KSQColor(112, 233, 205);
        _getCodeBtn.layer.cornerRadius = 20;
        _getCodeBtn.layer.masksToBounds = YES;
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_getCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_getCodeBtn addTarget:self action:@selector(getCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _getCodeBtn;
}

- (UIButton *)submitBtn {
    
    if (!_submitBtn) {
        
        _submitBtn = [[UIButton alloc] init];
        _submitBtn.layer.cornerRadius = 25;
        _submitBtn.layer.masksToBounds = YES;
        [_submitBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_submitBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _submitBtn;
}



@end
