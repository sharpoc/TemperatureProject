//
//  LXHomeViewController.m
//  TemperatureProject
//
//  Created by admin on 2020/6/11.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXHomeViewController.h"
#import "LXBluetoothManager.h"
#import "LXPeripheralListView.h"
#import "FLAnimatedImageView+WebCache.h"
#import "LXShowDetailViewController.h"
#import "LXPeripheral.h"
#import "LXSettingViewController.h"
#import "LXSettingItemModel.h"



@interface LXHomeViewController ()<LXBluetoothManagerDelegate,LXPeripheralListViewDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIButton *leftTopButton;
@property (nonatomic,strong) UIButton *rightTopButton;

@property (nonatomic,strong) FLAnimatedImageView *loadImageView;//gif图
@property (nonatomic,strong) UILabel *tipLabel;//正在寻找设备请稍等
//@property (nonatomic,strong) LXBluetoothManager *bluetoothManager;
@property (nonatomic,copy) NSArray *peripheralArray;
@property (nonatomic,strong) LXPeripheralListView *peripheralListView;



@end

@implementation LXHomeViewController

SystemSoundID ditaVoice;

static void completionCallback(SystemSoundID mySSID)
{
    // Play again after sound play completion
    AudioServicesPlaySystemSound(mySSID);
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createUI];
    [self createLayout];
    
    [LXBluetoothManager shareInstance].delegate = self;
    [[LXBluetoothManager shareInstance] start];
    

}



- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.loadImageView];
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.peripheralListView];
    
   
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil];

//        [self.navigationItem.rightBarButtonItem setImage:[UIImage imageNamed:@"titleButton"]];

        
    [self.navigationItem setBackBarButtonItem:backItem];
    
    [self.view addSubview:self.leftTopButton];
    [self.view addSubview:self.rightTopButton];
    
}

- (void)createLayout {
    
    [self.leftTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(25);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [self.rightTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.leftTopButton.mas_top);
        make.width.mas_equalTo(self.leftTopButton.mas_width);
        make.height.mas_equalTo(self.rightTopButton.mas_height);
    }];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(97);
        make.height.mas_equalTo(97);
        make.top.mas_equalTo(kNavigationBarHeight + 20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.loadImageView.mas_bottom).offset(15);
        make.height.mas_equalTo(35);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    [self.peripheralListView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(350);
    }];
}

- (void)leftTopButtonClick {
    
    LXSettingItemModel *groupManagerModel = [[LXSettingItemModel alloc] init];
    groupManagerModel.titleText = @"群组管理";
    groupManagerModel.iconText = @"group";
    groupManagerModel.itemType = SQSettingItemTypeGroupAdmin;
    
    LXSettingItemModel *deviceManagerModel = [[LXSettingItemModel alloc] init];
    deviceManagerModel.titleText = @"设备管理";
    deviceManagerModel.iconText = @"setting";
    deviceManagerModel.itemType = SQSettingItemTypeDeviceAdmin;
    
    LXSettingItemModel *wdManagerModel = [[LXSettingItemModel alloc] init];
    wdManagerModel.titleText = @"温度管理";
    wdManagerModel.iconText = @"police";
    wdManagerModel.itemType = SQSettingItemTypePoliceAdmin;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:groupManagerModel];
    [array addObject:deviceManagerModel];
    [array addObject:wdManagerModel];
    
    LXSettingViewController *settingVC = [[LXSettingViewController alloc] init];
    settingVC.lists = array;
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)rightTopButtonClick {
    
    LXSettingItemModel *adminManagerModel = [[LXSettingItemModel alloc] init];
    adminManagerModel.iconText = @"personcenter";
    adminManagerModel.titleText = @"账户管理";
    adminManagerModel.itemType = SQSettingItemTypeAdmin;
    
    LXSettingItemModel *helpModel = [[LXSettingItemModel alloc] init];
    helpModel.iconText = @"help";
    helpModel.titleText = @"帮助";
    helpModel.itemType = SQSettingItemTypeHelp;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:adminManagerModel];
    [array addObject:helpModel];
    
    LXSettingViewController *settingVC = [[LXSettingViewController alloc] init];
    settingVC.lists = array;
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark LXPeripheralListViewDelegate

- (void)didItem:(LXPeripheral *)peripheral {
    
    LXShowDetailViewController *detailVc = [[LXShowDetailViewController alloc] init];
    detailVc.peripheral = peripheral;
    [self.navigationController pushViewController:detailVc animated:YES];
}


#pragma mark LXBluetoothManagerDelegate
- (void)dataWithBluetoothDic:(NSMutableDictionary *)dict {
    
    self.peripheralArray = [dict allValues];
    self.peripheralListView.peripheralArray = self.peripheralArray;
}

- (UIButton *)leftTopButton {
    
    if (!_leftTopButton) {
        
        _leftTopButton = [[UIButton alloc] init];
        [_leftTopButton setImage:[UIImage imageNamed:@"home_left"] forState:UIControlStateNormal];
        [_leftTopButton addTarget:self action:@selector(leftTopButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftTopButton;
}

- (UIButton *)rightTopButton {
    
    if (!_rightTopButton) {
        
        _rightTopButton = [[UIButton alloc] init];
        [_rightTopButton setImage:[UIImage imageNamed:@"home_right"] forState:UIControlStateNormal];
        [_rightTopButton addTarget:self action:@selector(rightTopButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightTopButton;
}


- (UILabel *)tipLabel {
    
    if (!_tipLabel) {
        
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.font = [UIFont systemFontOfSize:18];
        _tipLabel.textColor = KSQColor(255, 255, 255);
        _tipLabel.text = @"  正在寻找设备请稍等  ";
        _tipLabel.backgroundColor = KSQColor(94, 219, 189);
        _tipLabel.layer.cornerRadius = 10;
        _tipLabel.layer.masksToBounds = YES;
    }
    
    return _tipLabel;
}

- (FLAnimatedImageView *)loadImageView {
    
    if (!_loadImageView) {
        
        _loadImageView = [[FLAnimatedImageView alloc] init];
        _loadImageView.backgroundColor = [UIColor clearColor];
        NSString *pathFile = [[NSBundle mainBundle] pathForResource:@"load" ofType:@"gif"];
        NSData *imagedata = [NSData dataWithContentsOfFile:pathFile];
        _loadImageView.backgroundColor = [UIColor clearColor];
        _loadImageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imagedata];
        
    }
    
    return _loadImageView;
}

- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"home"];
        _bgImageView.userInteractionEnabled = YES;
    }
    
    return _bgImageView;
}

- (LXPeripheralListView *)peripheralListView {
    
    if (!_peripheralListView) {
        
        _peripheralListView = [[LXPeripheralListView alloc] init];
        _peripheralListView.delegate = self;
    }
    
    return _peripheralListView;
}

@end


