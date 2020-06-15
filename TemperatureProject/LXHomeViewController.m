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


@interface LXHomeViewController ()<LXBluetoothManagerDelegate,LXPeripheralListViewDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) FLAnimatedImageView *loadImageView;//gif图
@property (nonatomic,strong) UILabel *tipLabel;//正在寻找设备请稍等
@property (nonatomic,strong) LXBluetoothManager *bluetoothManager;
@property (nonatomic,copy) NSArray *peripheralArray;
@property (nonatomic,strong) LXPeripheralListView *peripheralListView;


@end

@implementation LXHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createUI];
    [self createLayout];
    
    [self.bluetoothManager start];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.loadImageView];
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.peripheralListView];
    
}

- (void)createLayout {
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(97);
        make.height.mas_equalTo(97);
        make.top.mas_equalTo(30);
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
        make.height.mas_equalTo(200);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

}

#pragma mark LXPeripheralListViewDelegate

- (void)didItem:(CBPeripheral *)peripheral {
    
    [self.bluetoothManager connect:peripheral];
}


#pragma mark LXBluetoothManagerDelegate
- (void)dataWithBluetoothDic:(NSMutableDictionary *)dict {
    
    self.peripheralArray = [dict allValues];
    self.peripheralListView.peripheralArray = self.peripheralArray;
}


- (void)didConnectBlue {
    
    
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
        _loadImageView.backgroundColor = KSQRandomColor;
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

- (LXBluetoothManager *)bluetoothManager {
    
    if (!_bluetoothManager) {
        
        _bluetoothManager = [[LXBluetoothManager alloc] init];
        _bluetoothManager.delegate = self;
    }
    
    return _bluetoothManager;
}

@end
