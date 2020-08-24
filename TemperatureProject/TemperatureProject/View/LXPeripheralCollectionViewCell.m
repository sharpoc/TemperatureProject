//
//  LXPeripheralCollectionViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved. 
//

#import "LXPeripheralCollectionViewCell.h"
#import "LxPeripheral.h"

@interface LXPeripheralCollectionViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *idLabel;

@end

@implementation LXPeripheralCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = KSQColor(234, 234, 234);
        [self createUI];
        [self createLayout];
    }
    return self;
}

- (void)createUI{
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.idLabel];
}

- (void)createLayout{
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    [self.idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.height.mas_equalTo(30);
    }];
}


- (void)setPeripheral:(LXPeripheral *)peripheral {


    self.nameLabel.text = peripheral.peripheralName;
    self.idLabel.text = peripheral.mac;
}

- (void)setName:(NSString *)name {
    
    _name = name;
    if (![NSString sq_isEmpty:name]) {
        
        self.idLabel.text = name;
    }
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = KSQColor(116, 116, 116);
        _nameLabel.text = @"设备名字";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}

- (UILabel *)idLabel {
    
    if (!_idLabel) {
        
        _idLabel = [[UILabel alloc] init];
        _idLabel.textColor = KSQColor(116, 116, 116);
        _idLabel.text = @"设备id";
        _idLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _idLabel;
}

@end
