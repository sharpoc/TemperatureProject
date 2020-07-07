//
//  LXDeviceListTableViewCell.m
//  TemperatureProject
//
//  Created by admin on 2020/7/7.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXDeviceListTableViewCell.h"

@interface LXDeviceListTableViewCell ()

@property (nonatomic,strong) UILabel *deviceName;

@property (nonatomic,strong) UILabel *deviceID;

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
    
    
}

- (void)createLayout{
    
    
}
@end
