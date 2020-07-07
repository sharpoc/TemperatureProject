//
//  LXSettingItemTableViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXSettingItemTableViewCell.h"
#import "LXSettingItemModel.h"

@interface LXSettingItemTableViewCell ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleNameLablel;
@end

@implementation LXSettingItemTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"LXSettingItemTableViewCell";
    LXSettingItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LXSettingItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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
    [self.contentView addSubview:self.titleNameLablel];
}

- (void)createLayout{
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(35);
    }];
    
    [self.titleNameLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

- (void)setModel:(LXSettingItemModel *)model {
    
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.iconText];
    self.titleNameLablel.text = model.titleText;
}

- (UIImageView *)iconImageView {

    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] init];
        }
    
    return _iconImageView;
}
- (UILabel *)titleNameLablel {
    
    if (!_titleNameLablel) {
        
        _titleNameLablel = [[UILabel alloc] init];
    }
    
    return _titleNameLablel;
}



@end
