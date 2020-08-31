//
//  LXGroupItemTableViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/8/31.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXGroupItemTableViewCell.h"
#import "LXGroupItemModel.h"

@interface LXGroupItemTableViewCell ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UIButton *okBtn;
@end

@implementation LXGroupItemTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"LXGroupItemTableViewCell";
    LXGroupItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LXGroupItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
    
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.okBtn];
}

- (void)createLayout{
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(50);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(30);
        
    }];
    
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.nameLabel.mas_left);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
        make.right.mas_equalTo(self.nameLabel.mas_right);
    }];
    
    [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.nameLabel.mas_right);
        make.top.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.right.mas_equalTo(-5);
        make.width.mas_equalTo(60);
    }];
}

- (void)setModel:(LXGroupItemModel *)model {
    
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"群组名称:%@",model.name];
    self.codeLabel.text = [NSString stringWithFormat:@"群组码:%@",model.code];
    
}

- (void)okBtnClick {
    
    SQSafeBlock(self.clickBlock,self.model);
}

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"usericon"];
    }
    
    return _iconImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
    }
    
    return _nameLabel;
}

- (UILabel *)codeLabel {
    
    if (!_codeLabel) {
        
        _codeLabel = [[UILabel alloc] init];
    }
    
    return _codeLabel;
}

- (UIButton *)okBtn {
    
    if (!_okBtn) {
        
        _okBtn = [[UIButton alloc] init];
        [_okBtn setTitle:@"退出" forState:UIControlStateNormal];
        _okBtn.backgroundColor = KSQColor(49, 197, 159);
        [_okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _okBtn;
}

@end
