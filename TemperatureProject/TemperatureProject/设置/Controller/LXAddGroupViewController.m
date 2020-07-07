//
//  LXAddGroupViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXAddGroupViewController.h"

@interface LXAddGroupViewController ()

@property (nonatomic,strong) UITextField *textField;

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
}

- (void)createLayout {
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(self.navView.mas_bottom).offset(20);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(50);
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

@end
