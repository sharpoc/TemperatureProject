//
//  LXDeviceListTableViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceListTableViewCell.h"
#import "LXDeviceModel.h"

@interface LXDeviceListTableViewCell ()

@property (nonatomic,strong) UILabel *deviceNameLabel;

@property (nonatomic,strong) UILabel *deviceIDLabel;

@property (nonatomic,strong) UIButton *controlBtn;

@property (nonatomic,strong) UIButton *infoBtn;

@property (nonatomic,strong) UIButton *delBtn;



@end

@implementation LXDeviceListTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"LXDeviceListTableViewCell";
    LXDeviceListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LXDeviceListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = KSQColor(187, 222, 214);
        [self createUI];
        [self createLayout];
    }
    
    return self;
    
}

- (void)createUI{
    
    [self.contentView addSubview:self.deviceNameLabel];
    [self.contentView addSubview:self.deviceIDLabel];
    [self.contentView addSubview:self.controlBtn];
    [self.contentView addSubview:self.infoBtn];
    [self.contentView addSubview:self.delBtn];
}

- (void)createLayout{
    
    [self.deviceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.deviceIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.deviceNameLabel.mas_bottom);
        make.height.mas_equalTo(50);
    }];
    
    [self.controlBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.infoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.controlBtn.mas_right).offset(10);
        make.bottom.mas_equalTo(self.controlBtn.mas_bottom);
        make.height.mas_equalTo(self.controlBtn.mas_height);
        make.width.mas_equalTo(self.controlBtn.mas_width);
    }];
    
    [self.delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.infoBtn.mas_right).offset(10);
        make.bottom.mas_equalTo(self.controlBtn.mas_bottom);
        make.height.mas_equalTo(self.controlBtn.mas_height);
        make.width.mas_equalTo(self.controlBtn.mas_width);
        make.right.mas_equalTo(-10);
    }];
}

- (void)setModel:(LXDeviceModel *)model {
    
    _model = model;
    self.deviceNameLabel.text = [NSString stringWithFormat:@"设备名称:%@",model.name];
    self.deviceIDLabel.text = [NSString stringWithFormat:@"设备ID:%@",model.d_id];
}

- (void)controlBtnClick {
    
    if ([self.delegate respondsToSelector:@selector(controlClick:)]) {
        
        [self.delegate controlClick:self.model];
    }
}

- (void)infoBtnClick {
    
    if ([self.delegate respondsToSelector:@selector(infoClick:)]) {
        
        [self.delegate infoClick:self.model];
    }
}

- (void)delBtnClick {
    
    if ([self.delegate respondsToSelector:@selector(delClick:)]) {
        
        [self.delegate delClick:self.model];
    }
}

- (UILabel *)deviceNameLabel {
    
    if (!_deviceNameLabel) {
        
        _deviceNameLabel = [[UILabel alloc] init];
        _deviceNameLabel.textAlignment = NSTextAlignmentCenter;
        _deviceNameLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _deviceNameLabel;
}

- (UILabel *)deviceIDLabel {
    
    if (!_deviceIDLabel) {
        
        _deviceIDLabel = [[UILabel alloc] init];
        _deviceIDLabel.textAlignment = NSTextAlignmentCenter;
        _deviceIDLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _deviceIDLabel;
}

- (UIButton *)controlBtn {
    
    if (!_controlBtn) {
        
        _controlBtn = [[UIButton alloc] init];
        [_controlBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_controlBtn setTitle:@"报警管理" forState:UIControlStateNormal];
        _controlBtn.backgroundColor = KSQColor(120, 227, 202);
        _controlBtn.layer.cornerRadius = 25;
        _controlBtn.layer.masksToBounds = YES;
        [_controlBtn addTarget:self action:@selector(controlBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _controlBtn;
}

- (UIButton *)infoBtn {
    
    if (!_infoBtn) {
        
        _infoBtn = [[UIButton alloc] init];
        [_infoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_infoBtn setTitle:@"设备信息" forState:UIControlStateNormal];
        _infoBtn.backgroundColor = KSQColor(120, 227, 202);
        _infoBtn.layer.cornerRadius = 25;
        _infoBtn.layer.masksToBounds = YES;
        [_infoBtn addTarget:self action:@selector(infoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _infoBtn;
}

- (UIButton *)delBtn {
    
    if (!_delBtn) {
        
        _delBtn = [[UIButton alloc] init];
        [_delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _delBtn.backgroundColor = KSQColor(120, 227, 202);
        [_delBtn setTitle:@"删除设备" forState:UIControlStateNormal];
        _delBtn.layer.cornerRadius = 25;
        _delBtn.layer.masksToBounds = YES;
        [_delBtn addTarget:self action:@selector(delBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _delBtn;
}
@end
