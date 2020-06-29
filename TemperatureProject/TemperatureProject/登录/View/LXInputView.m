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

@end

@implementation LXInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = KSQColor(110, 14, 178).CGColor;
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

- (void)setImage:(UIImage *)image {
    
    _image = image;
    self.iconImageView.image = image;
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeCenter;
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
