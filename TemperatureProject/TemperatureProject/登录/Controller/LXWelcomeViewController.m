//
//  LXWelcomeViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/8.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXWelcomeViewController.h"
#import "LXHomeViewController.h"
#import "LXLoginViewController.h"
#import "LXRegisterViewController.h"

@interface LXWelcomeViewController ()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIButton *fastBtn;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *registerBtn;
@end

@implementation LXWelcomeViewController

- (void)viewDidLoad {
    
    self.navigationController.navigationBarHidden = YES;
    [super viewDidLoad];
    [self createUI];
    [self createLayout];
    
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.fastBtn];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.fastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(150);
        make.centerX.mas_equalTo(self.bgImageView.mas_centerX);
        make.centerY.mas_equalTo(self.bgImageView.mas_centerY).offset(-100);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(70);
        make.right.mas_equalTo(-70);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.fastBtn.mas_bottom).offset(180);
        
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(25);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
    }];
}

- (void)fastBtnClick {
    
    LXHomeViewController *homeVc = [[LXHomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = nav;
}

- (void)loginBtnClick {
    
    LXLoginViewController *homeVc = [[LXLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = nav;
}

- (void)registerBtnClick {
    
    LXRegisterViewController *registerVc = [[LXRegisterViewController alloc] init];
    
    [self.navigationController pushViewController:registerVc animated:YES];
}


- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.userInteractionEnabled = YES;
        _bgImageView.image = [UIImage imageNamed:@"welcomebg"];
    }
    
    return _bgImageView;
}

- (UIButton *)fastBtn {
    
    if (!_fastBtn) {
        
        _fastBtn = [[UIButton alloc] init];
        _fastBtn.layer.cornerRadius = 75;
        _fastBtn.layer.masksToBounds = YES;
        [_fastBtn setBackgroundImage:[UIImage imageNamed:@"welcomeIcon"] forState:UIControlStateNormal];
        [_fastBtn setTitle:@"快速检测" forState:UIControlStateNormal];
        [_fastBtn setTitleColor:KSQColor(8, 163, 163) forState:UIControlStateNormal];
        _fastBtn.titleLabel.font = [UIFont systemFontOfSize:24];
        [_fastBtn addTarget:self action:@selector(fastBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _fastBtn;
}

- (UIButton *)loginBtn {
    
    if (!_loginBtn) {
        
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"用户登入" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 25;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginBtn;
}

- (UIButton *)registerBtn {
    
    if (!_registerBtn) {
        
        _registerBtn = [[UIButton alloc] init];
        _registerBtn.backgroundColor = [UIColor clearColor];
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _registerBtn;
}

@end
