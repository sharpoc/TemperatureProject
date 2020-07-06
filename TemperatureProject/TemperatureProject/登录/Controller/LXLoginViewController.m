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
#import "LXUserRegisterModel.h"
#import "LXHomeViewController.h"
#import "LXFindPwdViewController.h"

@interface LXLoginViewController ()

@property (nonatomic,strong) LXLoginViewModel *viewModel;
@property (nonatomic,strong) UIImageView *phoneIconImageView;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UIImageView *pwdIconImageView;
@property (nonatomic,strong) UITextField *pwdTextField;
@property (nonatomic,strong) UIButton *yanButton;
@property (nonatomic,strong) UIButton *commitBtn;
@property (nonatomic,strong) UIButton *findPwdBtn;
@property (nonatomic,strong) UIButton *registerBtn;

@end

@implementation LXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.phoneIconImageView];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.pwdIconImageView];
    [self.view addSubview:self.pwdTextField];
    [self.view addSubview:self.yanButton];
    [self.view addSubview:self.commitBtn];
    [self.view addSubview:self.findPwdBtn];
    [self.view addSubview:self.registerBtn];
}

- (void)createLayout {
    
    
    [self.phoneIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.mas_equalTo(self.phoneIconImageView.mas_right);
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(self.phoneIconImageView.mas_top);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.pwdIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.phoneIconImageView.mas_left);
        make.width.mas_equalTo(self.phoneIconImageView.mas_width);
        make.height.mas_equalTo(self.phoneIconImageView.mas_height);
        make.top.mas_equalTo(self.phoneIconImageView.mas_bottom).offset(20);
        
    }];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.pwdIconImageView.mas_right);
        make.right.mas_equalTo(self.phoneTextField.mas_right);
        make.height.mas_equalTo(self.phoneTextField.mas_height);
        make.top.mas_equalTo(self.pwdIconImageView.mas_top);
    }];
    
    [self.yanButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(self.pwdTextField.mas_right);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.pwdTextField.mas_top);
    }];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.pwdTextField.mas_bottom).offset(50);
    }];
    
    [self.findPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.commitBtn.mas_left);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.commitBtn.mas_bottom).offset(0);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.commitBtn.mas_right);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.findPwdBtn.mas_top);
    }];
    
    [self.view layoutIfNeeded];
    CALayer *phoneBottomBorder = [CALayer layer];
    phoneBottomBorder.backgroundColor = [UIColor orangeColor].CGColor;
    phoneBottomBorder.frame = CGRectMake(0.0f, self.phoneTextField.frame.size.height - 1, self.phoneTextField.frame.size.width, 1.0f);
    phoneBottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.phoneTextField.layer addSublayer:phoneBottomBorder];
    
    CALayer *pwdBottomBorder = [CALayer layer];
    pwdBottomBorder.backgroundColor = [UIColor orangeColor].CGColor;
    pwdBottomBorder.frame = CGRectMake(0.0f, self.pwdTextField.frame.size.height - 1, self.pwdTextField.frame.size.width, 1.0f);
    pwdBottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.pwdTextField.layer addSublayer:pwdBottomBorder];
}

- (void)commitBtnClick {
    
    LXUserRegisterModel *registermodel = [[LXUserRegisterModel alloc] init];
    registermodel.phone = self.phoneTextField.text;
    registermodel.pwd = self.pwdTextField.text;
    [self.viewModel loginWithModel:registermodel withBlock:^(BOOL success, NSString * _Nonnull msg, LXUserTokenModel * _Nonnull model) {
        
        if (success) {
            
            [[LXCacheManager shareInstance] saveCacheWithArchiveForKey:@"loginuser" withObject:model];
            LXHomeViewController *homeVc = [[LXHomeViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVc];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = nav;
        } else {
            
            [LXTostHUD showTitle:msg];
        }
        

    }];
}

- (void)findPwdBtnClick {
    
    LXFindPwdViewController *findPwdVC = [[LXFindPwdViewController alloc] init];
    [self.navigationController pushViewController:findPwdVC animated:YES];
}

- (void)registerBtnClick {
    
    LXRegisterViewController *registerVc = [[LXRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)yanButtonClick {
    
    self.yanButton.selected = !self.yanButton.selected;
    
    if (self.yanButton.selected) { // 按下去了就是明文
        
        NSString *tempPwdStr = self.pwdTextField.text;
        self.pwdTextField.text = @""; // 这句代码可以防止切换的时候光标偏移
        self.pwdTextField.secureTextEntry = NO;
        self.pwdTextField.text = tempPwdStr;
        
    } else { // 暗文
        
        NSString *tempPwdStr = self.pwdTextField.text;
        self.pwdTextField.text = @"";
        self.pwdTextField.secureTextEntry = YES;
        self.pwdTextField.text = tempPwdStr;
    }
}

- (UIImageView *)phoneIconImageView {
    
    if (!_phoneIconImageView) {
        
        _phoneIconImageView = [[UIImageView alloc] init];
        _phoneIconImageView.contentMode = UIViewContentModeCenter;
        _phoneIconImageView.image = [UIImage imageNamed:@"loginPhone"];
    }
    
    return _phoneIconImageView;
}

- (UITextField *)phoneTextField {
    
    if (!_phoneTextField) {
        
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.text = @"18501302581";

    }
    
    return _phoneTextField;
}

- (UIImageView *)pwdIconImageView {
    
    if (!_pwdIconImageView) {
        
        _pwdIconImageView = [[UIImageView alloc] init];
        _pwdIconImageView.contentMode = UIViewContentModeCenter;
        _pwdIconImageView.image  = [UIImage imageNamed:@"loginPwd"];
    }
    
    return _pwdIconImageView;
}

- (UITextField *)pwdTextField {
    
    if (!_pwdTextField) {
        
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.secureTextEntry = YES;
        _pwdTextField.text = @"111111";
    }
    
    return _pwdTextField;
}

- (UIButton *)yanButton {
    
    if (!_yanButton) {
        
        _yanButton = [[UIButton alloc] init];
        [_yanButton setImage:[UIImage imageNamed:@"loginYan"] forState:UIControlStateNormal];
        [_yanButton addTarget:self action:@selector(yanButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _yanButton;
}

- (UIButton *)commitBtn {
    
    if (!_commitBtn) {
        
        _commitBtn = [[UIButton alloc] init];
        [_commitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_commitBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _commitBtn.layer.cornerRadius = 25;
        _commitBtn.layer.masksToBounds = YES;
    }
    
    return _commitBtn;
}

- (UIButton *)findPwdBtn {
    
    if (!_findPwdBtn) {
        
        _findPwdBtn = [[UIButton alloc] init];
        _findPwdBtn.backgroundColor = [UIColor clearColor];
        [_findPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_findPwdBtn addTarget:self action:@selector(findPwdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _findPwdBtn;
}

- (UIButton *)registerBtn {
    
    if (!_registerBtn) {
        
        _registerBtn = [[UIButton alloc] init];
        _registerBtn.backgroundColor = [UIColor clearColor];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _registerBtn;
}



- (LXLoginViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXLoginViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
