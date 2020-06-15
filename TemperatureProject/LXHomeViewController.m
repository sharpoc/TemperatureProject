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


@interface LXHomeViewController ()<LXBluetoothManagerDelegate,LXPeripheralListViewDelegate>

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *loadImageView;
@property (nonatomic,strong) LXBluetoothManager *bluetoothManager;
@property (nonatomic,copy) NSArray *peripheralArray;
@property (nonatomic,strong) LXPeripheralListView *peripheralListView;

//@property (nonatomic,strong) CBCentralManager *centralManager;
//@property (nonatomic,copy) NSMutableDictionary *deviceDic;
//@property (nonatomic,strong) CBPeripheral *peripheral;
//@property (nonatomic,strong) CBCharacteristic *characteristic;

@end

@implementation LXHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createUI];
    [self createLayout];
//    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

- (void)createUI {
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.loadImageView];
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
    
    [self.peripheralListView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.bluetoothManager start];
//    NSArray *array = [self.deviceDic allValues];
//    if (array.count > 0) {
//
//        CBPeripheral *peripheral = [array objectAtIndex:0];
//        [self.centralManager connectPeripheral:peripheral options:nil];
//    }
   
}

#pragma mark LXPeripheralListViewDelegate

- (void)didItem:(CBPeripheral *)peripheral {
    
    [self.bluetoothManager connect:peripheral];
}


#pragma mark LXBluetoothManagerDelegate
- (void)dataWithBluetoothDic:(NSMutableDictionary *)dict {
    
    self.peripheralArray = [dict allValues];

//    NSMutableArray *tempArray= [NSMutableArray array];
//    [tempArray addObjectsFromArray:self.peripheralArray];
//    [tempArray addObjectsFromArray:self.peripheralArray];
//    [tempArray addObjectsFromArray:self.peripheralArray];
//    [tempArray addObjectsFromArray:self.peripheralArray];
    
    
    self.peripheralListView.peripheralArray = self.peripheralArray;
}


- (void)didConnectBlue {
    
    
}

- (UIImageView *)loadImageView {
    
    if (!_loadImageView) {
        
        _loadImageView = [[UIImageView alloc] init];
        _loadImageView.backgroundColor = KSQRandomColor;
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
