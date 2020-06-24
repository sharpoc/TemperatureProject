//
//  LXInputView.m
//  TemperatureProject
//
//  Created by admin on 2020/6/23.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXInputView.h"

@interface LXInputView ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UITextField *inputTextField;
@end

@implementation LXInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
        [self createLayout];
    }
    return self;
}

- (void)createUI {
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.inputTextField];
}

- (void)createLayout {
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.iconImageView.mas_right);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

- (NSString *)text {
    
    return self.inputTextField.text;
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = KSQRandomColor;
    }
    
    return _iconImageView;
}

- (UITextField *)inputTextField {
    
    if (!_inputTextField) {
        
        _inputTextField = [[UITextField alloc] init];
    }
    
    return _inputTextField;
}
@end
