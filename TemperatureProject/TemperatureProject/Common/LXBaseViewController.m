//
//  LXBaseViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXBaseViewController.h"

@interface LXBaseViewController ()

@property (nonatomic,strong) UIButton *backBtn;

@end

@implementation LXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;

    [self initUI];
    [self initLayout];
}

- (void)initUI {
    
    [self.view addSubview:self.navView];
    [self.navView addSubview:self.backBtn];
}

- (void)initLayout {
    
    
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(kNavigationBarHeight);
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)backBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)navView {
    
    if (!_navView) {
        
        _navView = [[UIView alloc] init];
        _navView.backgroundColor = KSQColor(49, 197, 159);
        
    }
    
    return _navView;
}

- (UIButton *)backBtn {
    
    if (!_backBtn) {
        
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"navBackIcon_white"] forState:UIControlStateNormal];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backBtn;
}

@end
