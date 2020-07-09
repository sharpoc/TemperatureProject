//
//  LXShowDetailViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/15.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXShowDetailViewController.h"
#import "LXSetAlarmViewController.h"
#import "LXBluetoothManager.h"
#import "LXShowDetailViewModel.h"
#import "LXDeviceModel.h"
#import "LXUserTokenModel.h"
#import "LXPeripheral.h"
#import "LXTemperatureModel.h"
#import "LXLoopTemperatureViewController.h"
#import "LXHistoryTemperatureViewController.h"

@interface LXShowDetailViewController ()<LXBluetoothManagerDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIButton *titleButton;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *timeTitleLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIButton *disconnectBtn;
@property (nonatomic,strong) UIButton *continuedTestBtn;
@property (nonatomic,strong) UIButton *historyBtn;
@property (nonatomic,strong) LXShowDetailViewModel *viewModel;

@end

@implementation LXShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    [self createLayout];

    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [settingButton setImage:[UIImage imageNamed:@"settingIcon"] forState:UIControlStateNormal];
    [settingButton setTitleColor:KSQRandomColor forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(settingButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = rightItem;
 
    [LXBluetoothManager shareInstance].delegate = self;
    [[LXBluetoothManager shareInstance] connect:self.peripheral.peripheral];
    [[LoadingHUDManager shareInstance] showHUDProgress];
    
    [self addDevice];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.titleButton];
    [self.bgView addSubview:self.numLabel];
    [self.bgView addSubview:self.timeTitleLabel];
    [self.bgView addSubview:self.timeLabel];
    [self.bgView addSubview:self.disconnectBtn];
    [self.bgView addSubview:self.continuedTestBtn];
    [self.bgView addSubview:self.historyBtn];
    
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.bottom.mas_equalTo(0);
        
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-20);
        make.top.mas_equalTo(kNavigationBarHeight + 20);
    }];
    
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.bgView.mas_top).offset(20);
        make.width.mas_equalTo(154);
        make.height.mas_equalTo(48);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.titleButton.mas_bottom).offset(25);
    }];
    
    [self.timeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.numLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(30);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.timeTitleLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    [self.disconnectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(53);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(20);
    }];
    
    [self.continuedTestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.disconnectBtn.mas_left);
        make.right.mas_equalTo(self.disconnectBtn.mas_right);
        make.height.mas_equalTo(self.disconnectBtn.mas_height);
        make.top.mas_equalTo(self.disconnectBtn.mas_bottom).offset(20);
    }];
    
    [self.historyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.disconnectBtn.mas_left);
        make.right.mas_equalTo(self.disconnectBtn.mas_right);
        make.height.mas_equalTo(self.disconnectBtn.mas_height);
        make.top.mas_equalTo(self.continuedTestBtn.mas_bottom).offset(20);
    }];
}

- (void)setNumValue:(double)numValue {
    
    [[LoadingHUDManager shareInstance] hidHUDProgress];
    
    self.numLabel.text = [NSString stringWithFormat:@"%.1f°C",numValue];
    NSDate *date = [NSDate date];
    self.timeLabel.text = [Tool localTimeZoneStringDate:date andFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)disconnectBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)continuedTestBtnClick {
    
    LXLoopTemperatureViewController *loopTemperatureVC = [[LXLoopTemperatureViewController alloc] init];
    loopTemperatureVC.peripheral = self.peripheral;
    [self.navigationController pushViewController:loopTemperatureVC animated:YES];
}

- (void)settingButtonClicked {
    
    LXSetAlarmViewController *setAlarmVc = [[LXSetAlarmViewController alloc] init];
    [self.navigationController pushViewController:setAlarmVc animated:YES];
}

- (void)historyBtnClick {
    
    LXHistoryTemperatureViewController *hisVC = [[LXHistoryTemperatureViewController alloc] init];
    hisVC.mac = self.peripheral.mac;
    [self.navigationController pushViewController:hisVC animated:YES];
}

- (void)addDevice {
    
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];

    LXDeviceModel *model = [[LXDeviceModel alloc] init];
    model.phone = loginModel.user.phone;
    model.deviceId = self.peripheral.mac;
    [self.viewModel addDevice:model withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
        if (success) {
            
            [LXTostHUD showTitle:msg];
        }
    }];
}


#pragma mark LXBluetoothManagerDelegate
- (void)didConnectBlue {
    
    
}

- (void)temperatureComplete:(double)numValue {

    NSString *wenduValue =  [[LXCacheManager shareInstance] objectCacheAt:@"wendu"];
    if (numValue > [wenduValue doubleValue]) {
//       [Tool playSound];
    }
    self.numValue = numValue;
    NSDate *datenow = [NSDate date];//现在时间
    //这里如果long不够用,就用(long long)
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000)];
    LXUserTokenModel *loginModel = [[LXCacheManager shareInstance] unarchiveDataForKey:@"loginuser"];
    LXTemperatureModel *temperatureModel = [[LXTemperatureModel alloc] init];
    temperatureModel.phone = loginModel.user.phone;
    temperatureModel.name = loginModel.user.username;
    temperatureModel.deviceId = self.peripheral.mac;
    temperatureModel.recordTime = timeSp;
    temperatureModel.temperature = [@(numValue) stringValue];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:temperatureModel];
    
    
    [self.viewModel uploadTemperature:array withBlock:^(BOOL success, NSString * _Nonnull msg, NSObject * _Nonnull model) {
        
    }];
}

- (LXShowDetailViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXShowDetailViewModel alloc] init];
    }
    
    return _viewModel;
}

- (UIButton *)historyBtn {
    
    if (!_historyBtn) {
        
        _historyBtn = [[UIButton alloc] init];
        [_historyBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_historyBtn setTitle:@"历史温度" forState:UIControlStateNormal];
        [_historyBtn addTarget:self action:@selector(historyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _historyBtn;
}

- (UIButton *)continuedTestBtn {
    
    if (!_continuedTestBtn) {
        
        _continuedTestBtn = [[UIButton alloc] init];
        [_continuedTestBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_continuedTestBtn setTitle:@"连续监测" forState:UIControlStateNormal];
        [_continuedTestBtn addTarget:self action:@selector(continuedTestBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _continuedTestBtn;
}

- (UIButton *)disconnectBtn {
    
    if (!_disconnectBtn) {
        
        _disconnectBtn = [[UIButton alloc] init];
        [_disconnectBtn setBackgroundImage:[UIImage imageNamed:@"disconnectBtn"] forState:UIControlStateNormal];
        [_disconnectBtn setTitle:@"断开连接" forState:UIControlStateNormal];
        [_disconnectBtn addTarget:self action:@selector(disconnectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _disconnectBtn;
}

- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = KSQColor(76, 219, 191);
        _timeLabel.font = [UIFont systemFontOfSize:18];
        _timeLabel.textAlignment = NSTextAlignmentCenter; 
    }
    
    return _timeLabel;
}

- (UILabel *)timeTitleLabel {
    
    if (!_timeTitleLabel) {
        
        _timeTitleLabel = [[UILabel alloc] init];
        _timeTitleLabel.textColor = KSQColor(76, 219, 191);
        _timeTitleLabel.font = [UIFont systemFontOfSize:24];
        _timeTitleLabel.textAlignment = NSTextAlignmentCenter;
        _timeTitleLabel.text = @"测量时间";
    }
    
    return _timeTitleLabel;
}

- (UILabel *)numLabel {
    
    if (!_numLabel) {
        
        _numLabel = [[UILabel alloc] init];
        _numLabel.textColor = KSQColor(98, 216, 193);
        _numLabel.font = [UIFont systemFontOfSize:60];
        _numLabel.text = @"0°C";
        _numLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _numLabel;
}

- (UIButton *)titleButton {
    
    if (!_titleButton) {
        
        _titleButton = [[UIButton alloc] init];
        [_titleButton setTitle:@"您的体温" forState:UIControlStateNormal];
        [_titleButton setBackgroundImage:[UIImage imageNamed:@"titleButton"] forState:UIControlStateNormal];
        _titleButton.layer.cornerRadius = 20;
        _titleButton.layer.masksToBounds = YES;
    }
    
    return _titleButton;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 10;
    }
    
    return _bgView;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"showdetail"];

    }
    
    return _bgImageView;
}



@end
