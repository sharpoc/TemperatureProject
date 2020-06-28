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

@interface LXLoginViewController ()

@property (nonatomic,strong) LXLoginViewModel *viewModel;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UITextField *pwdTextField;
@property (nonatomic,strong) UIButton *commitBtn;

@end

@implementation LXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.pwdTextField];
    [self.view addSubview:self.commitBtn];
}

- (void)createLayout {
    
    
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.phoneTextField.mas_left);
        make.right.mas_equalTo(self.phoneTextField.mas_right);
        make.height.mas_equalTo(self.phoneTextField.mas_height);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(50);
    }];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.pwdTextField.mas_bottom).offset(50);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LXRegisterViewController *registerVc = [[LXRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
    
}

- (void)commitBtnClick {
    
    LXUserRegisterModel *model = [[LXUserRegisterModel alloc] init];
    model.phone = self.phoneTextField.text;
    model.pwd = self.pwdTextField.text;
    [self.viewModel loginWithModel:model withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
//        dispatch_async(dispatch_get_main_queue(), ^{
              
            LXHomeViewController *homeVc = [[LXHomeViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVc];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = nav;
//        });
        
    }];
}

- (UIButton *)commitBtn {
    
    if (!_commitBtn) {
        
        _commitBtn = [[UIButton alloc] init];
        [_commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _commitBtn.backgroundColor = KSQRandomColor;
    }
    
    return _commitBtn;
}

- (UITextField *)phoneTextField {
    
    if (!_phoneTextField) {
        
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.backgroundColor = KSQRandomColor;
    }
    
    return _phoneTextField;
}

- (UITextField *)pwdTextField {
    
    if (!_pwdTextField) {
        
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.backgroundColor = KSQRandomColor;
    }
    
    return _pwdTextField;
}

- (LXLoginViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXLoginViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
