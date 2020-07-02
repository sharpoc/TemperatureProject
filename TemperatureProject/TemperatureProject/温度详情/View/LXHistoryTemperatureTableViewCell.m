//
//  LXHistoryTemperatureTableViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/7/2.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHistoryTemperatureTableViewCell.h"
#import "LXHistoryTemperatureModel.h"

@interface LXHistoryTemperatureTableViewCell ()

@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *temperatureLabel;
@property (nonatomic,strong) UIView *split1View;
@property (nonatomic,strong) UIView *split2View;

@end

@implementation LXHistoryTemperatureTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"LXHistoryTemperatureTableViewCell";
    LXHistoryTemperatureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LXHistoryTemperatureTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = KSQRandomColor;
        [self createUI];
        [self createLayout];
    }
    
    return self;
    
}

- (void)createUI{
    
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.temperatureLabel];
    [self.contentView addSubview:self.split1View];
    [self.contentView addSubview:self.split2View];
    
    
}

- (void)createLayout{
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        
    }];
    [self.split1View mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.timeLabel.mas_right);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(0);
        
    }];
    
    [self.temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(self.split1View.mas_right);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(self.timeLabel.mas_width);
        make.bottom.mas_equalTo(self.timeLabel.mas_bottom);
    }];
    
    [self.split2View mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.timeLabel.mas_bottom);
        make.height.mas_equalTo(1);
        
    }];
}

- (void)setModel:(LXHistoryTemperatureModel *)model {
    
    NSTimeInterval interval = [model.recordTime doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *dateStr = [date sq_stringWithFormat:@"yyyy-MM-dd HH:mm"];
    self.timeLabel.text = dateStr;
    
    self.temperatureLabel.text = [NSString stringWithFormat:@"%.1f",[model.temperature doubleValue]];
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _timeLabel;
}

- (UILabel *)temperatureLabel {
    
    if (!_temperatureLabel) {
        
        _temperatureLabel = [[UILabel alloc] init];
        _temperatureLabel.backgroundColor = [UIColor whiteColor];
        _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _temperatureLabel;
}

- (UIView *)split1View {
    
    if (!_split1View) {
        
        _split1View = [[UIView alloc] init];
        _split1View.backgroundColor = [UIColor grayColor];
    }
    
    return _split1View;
}

- (UIView *)split2View {
    
    if (!_split2View) {
        
        _split2View = [[UIView alloc] init];
        _split2View.backgroundColor = [UIColor grayColor];
    }
    
    return _split2View;
}

@end
