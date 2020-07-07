//
//  LXAddGroupViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXAddGroupViewController.h"
#import "LXAddGroupViewModel.h"

@interface LXAddGroupViewController ()

@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) LXAddGroupViewModel *viewModel;


@end

@implementation LXAddGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KSQColor(187, 222, 214);
    // Do any additional setup after loading the view.
    [self createUI];
    [self createLayout];
}

- (void)createUI {
    
    [self.view addSubview:self.textField];
    [self.navView addSubview:self.addBtn];
}

- (void)createLayout {
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.navView.mas_bottom).offset(20);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(50);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)commitButtonClick {
    
    NSString *code = self.textField.text;
    
    [self.viewModel addGroupWithCode:code andBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
       
        if (success) {
            
            [LXTostHUD showTitle:msg];
        }
    }];
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

- (UIButton *)addBtn {
    
    if (!_addBtn) {
        
        _addBtn = [[UIButton alloc] init];
        _addBtn.backgroundColor = [UIColor clearColor];
        [_addBtn setTitle:@"添加群组" forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addBtn;
}

- (LXAddGroupViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXAddGroupViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
