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

@interface LXUpdateUserNameViewController ()

@property (nonatomic,strong) LXUpdateUserNameViewModel *viewModel;
@property (nonatomic,strong) UIView *topBgView;
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
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)createUI {
    
    [self.view addSubview:self.topBgView];
    [self.view addSubview:self.textField];
    [self.topBgView addSubview:self.backButton];
    [self.topBgView addSubview:self.commitButton];
}

- (void)createLayout {
    
    [self.topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(kNavigationBarHeight);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.topBgView.mas_bottom).offset(20);
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

- (UIView *)topBgView {
    
    if (!_topBgView) {
        
        _topBgView = [[UIView alloc] init];
        _topBgView.backgroundColor = KSQColor(49, 197, 159);
    }
    
    return _topBgView;
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

- (UIButton *)backButton {
    
    if (!_backButton) {
        
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"navBackIcon_white"] forState:UIControlStateNormal];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    return _backButton;
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
