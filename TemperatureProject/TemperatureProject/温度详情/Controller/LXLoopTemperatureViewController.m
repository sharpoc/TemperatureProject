//
//  LXShowDetailViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/15.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXLoopTemperatureViewController.h"
#import "LXSetAlarmViewController.h"
#import "LXBluetoothManager.h"
#import "LXShowDetailViewModel.h"
#import "LXDeviceModel.h"
#import "LXUserTokenModel.h"
#import "LXPeripheral.h"
#import "LXTemperatureModel.h"
#import "AAChartKit.h"

@interface LXLoopTemperatureViewController ()<LXBluetoothManagerDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIButton *titleButton;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) LXShowDetailViewModel *viewModel;
@property (nonatomic,strong) AAChartView *chartView;



@end

@implementation LXLoopTemperatureViewController

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
    [self showChartData];
}

- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.titleButton];
    [self.bgView addSubview:self.numLabel];
    [self.bgView addSubview:self.chartView];
    
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
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
    
    [self.chartView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.numLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(200);
    }];
    
    
}

- (void)setNumValue:(double)numValue {
    
    [[LoadingHUDManager shareInstance] hidHUDProgress];
    self.numLabel.text = [NSString stringWithFormat:@"%.1f°C",numValue];
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

- (void)showChartData {

    AAChartModel *aaChartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeArea)//设置图表的类型(这里以设置的为折线面积图为例)
    .yAxisTickPositionsSet(@[@"35",@"36",@"37",@"38", @"39"])
    .categoriesSet(@[@"1",@"2",@"3",@"4", @"5",@"6",@"7",@"8",@"9"])//图表横轴的内容
    .yAxisTitleSet(@"摄氏度")//设置图表 y 轴的单位
    .seriesSet(@[
            AAObject(AASeriesElement)
            .nameSet(nil)
            .dataSet(@[@3.9, @4.2, @5.7, @8.5, @11.9, @15.2, @17.0, @16.6, @14.2, @10.3, @6.6, @4.8]),
                     ])
    ;
    
    /*图表视图对象调用图表模型对象,绘制最终图形*/
    [self.chartView aa_drawChartWithChartModel:aaChartModel];


}

- (void)disconnectBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)settingButtonClicked {
    
    LXSetAlarmViewController *setAlarmVc = [[LXSetAlarmViewController alloc] init];
    [self.navigationController pushViewController:setAlarmVc animated:YES];
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

- (AAChartView *)chartView {
    
    if (!_chartView) {
        
        _chartView = [[AAChartView alloc] init];
        
    }
    
    return _chartView;
}

- (LXShowDetailViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[LXShowDetailViewModel alloc] init];
    }
    
    return _viewModel;
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
