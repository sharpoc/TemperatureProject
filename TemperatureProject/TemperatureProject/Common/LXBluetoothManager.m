//
//  LXBluetoothManager.m
//  TemperatureProject
//
//  Created by admin on 2020/6/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXBluetoothManager.h"
#import "LXConstant.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "LxPeripheral.h"

@interface LXBluetoothManager ()<CBCentralManagerDelegate,CBPeripheralDelegate>

@property (nonatomic,strong) CBCentralManager *centralManager;

@property (nonatomic,strong) CBPeripheral *peripheral;
@property (nonatomic,strong) CBCharacteristic *characteristic;

@end

@implementation LXBluetoothManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       
    }
    return self;
}



//单例
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static LXBluetoothManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[LXBluetoothManager alloc] init];
        
    });
    return manager;
}



- (void)start{
    
    self.centralManager.delegate = self;
}

- (void)connect:(CBPeripheral *)peripheral {
    
    [self.centralManager connectPeripheral:peripheral options:nil];

}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    switch (central.state) {
        case CBCentralManagerStateUnknown:
            NSLog(@">>>CBCentralManagerStateUnknown");
            break;
        case CBCentralManagerStateResetting:
            NSLog(@">>>CBCentralManagerStateResetting");
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@">>>CBCentralManagerStateUnsupported");
            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@">>>CBCentralManagerStateUnauthorized");
            break;
        case CBCentralManagerStatePoweredOff:
            NSLog(@">>>CBCentralManagerStatePoweredOff");
            break;
        case CBCentralManagerStatePoweredOn:
        {
            NSLog(@">>>CBCentralManagerStatePoweredOn");
            // 开始扫描周围的外设。
            /*
             -- 两个参数为Nil表示默认扫描所有可见蓝牙设备。
             -- 注意：第一个参数是用来扫描有指定服务的外设。然后有些外设的服务是相同的，比如都有FFF5服务，那么都会发现；而有些外设的服务是不可见的，就会扫描不到设备。
             -- 成功扫描到外设后调用didDiscoverPeripheral
             */
            [self.centralManager scanForPeripheralsWithServices:nil options:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark 发现外设
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    
        
        if (peripheral!=nil) {
            if ([peripheral name]!=nil) {
                NSLog(@"Find device:%@--%@", [peripheral name],peripheral.identifier.UUIDString);
                if ([[peripheral name] hasPrefix:BRAND] || [[peripheral name] hasPrefix:BRAND2]) {
                    
                    
                    NSData *data = [advertisementData objectForKey:@"kCBAdvDataManufacturerData"];
                    NSInteger length = [data length];
                    Byte *getbyte = (Byte *)[data bytes];
                    NSString *mac = @"";
                    if (length > 0) {
                        
                        mac = [self ToHex:getbyte[0]];
                        for(int i = 1;i < length; i++ ){
                               
                            NSString *num = [self ToHex:getbyte[i]];
                            if (num.length==1) {
                                
                                num = [NSString stringWithFormat:@"0%@",num];
                            }
                            mac = [NSString stringWithFormat:@"%@:%@",mac,num];
                        }
                        
                    }
//                    if (![mac isEqualToString:@""]) {
                        
                        LXPeripheral *lxPeripheral = [[LXPeripheral alloc] init];
                        lxPeripheral.peripheral = peripheral;
                        lxPeripheral.peripheralName = [peripheral name];
                        lxPeripheral.mac = [mac isEqualToString:@""]? @"没有mac地址": mac;
                        [self.deviceDic setObject:lxPeripheral forKey:mac];
                        if ([self.delegate respondsToSelector:@selector(dataWithBluetoothDic:)]) {
                            [self.delegate dataWithBluetoothDic:_deviceDic];
                        }
//                    }
                }
            }
        }
    
}

#pragma mark 连接外设--成功
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    //连接成功后停止扫描，节省内存
//    [central stopScan];
    peripheral.delegate = self;
    self.peripheral = peripheral;
    //4.扫描外设的服务
    /**
     --     外设的服务、特征、描述等方法是CBPeripheralDelegate的内容，所以要先设置代理peripheral.delegate = self
     --     参数表示你关心的服务的UUID，比如我关心的是"FFE0",参数就可以为@[[CBUUID UUIDWithString:@"FFE0"]].那么didDiscoverServices方法回调内容就只有这两个UUID的服务，不会有其他多余的内容，提高效率。nil表示扫描所有服务
     --     成功发现服务，回调didDiscoverServices
     */
    [peripheral discoverServices:@[[CBUUID UUIDWithString:SERVICE_UUID]]];
    if ([self.delegate respondsToSelector:@selector(didConnectBlue)]) {
       // 已经连接
        [self.delegate didConnectBlue];
    }
}

#pragma mark 发现服务回调
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    
    //NSLog(@"didDiscoverServices,Error:%@",error);
    CBService * __nullable findService = nil;
    // 遍历服务
    for (CBService *service in peripheral.services)
    {
        //NSLog(@"UUID:%@",service.UUID);
        if ([[service UUID] isEqual:[CBUUID UUIDWithString:SERVICE_UUID]])
        {
            findService = service;
        }
    }
    NSLog(@"Find Service:%@",findService);
    if (findService)
        [peripheral discoverCharacteristics:NULL forService:findService];
}

#pragma mark 发现特征回调
/**
 --  发现特征后，可以根据特征的properties进行：读readValueForCharacteristic、写writeValue、订阅通知setNotifyValue、扫描特征的描述discoverDescriptorsForCharacteristic。
 **/
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:CHARACTER_UUID]]) {
            
            /**
             -- 读取成功回调didUpdateValueForCharacteristic
             */
            self.characteristic = characteristic;
            // 接收一次(是读一次信息还是数据经常变实时接收视情况而定, 再决定使用哪个)
            
//            for (int i = 0; i < 5; i++) {
                
                [peripheral readValueForCharacteristic:characteristic];
            
            
            // 订阅, 实时接收
//            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
            
//            // 发送下行指令(发送一条)
//            NSData *data = [@"硬件工程师给我的指令, 发送给蓝牙该指令, 蓝牙会给我返回一条数据" dataUsingEncoding:NSUTF8StringEncoding];
//            // 将指令写入蓝牙
//                [self.peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
        }

        /**
         -- 当发现characteristic有descriptor,回调didDiscoverDescriptorsForCharacteristic
         */
        [peripheral discoverDescriptorsForCharacteristic:characteristic];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    
    Byte *getbyte = (Byte *)[characteristic.value bytes];
    NSMutableArray *byteArr = [NSMutableArray array];
    for(int i = 0;i < [characteristic.value length];i++ ){
        
        [byteArr addObject:@(getbyte[i])];
    }
    double doubleValue = 0;
    for (int i = 0; i < byteArr.count; i++) {
        
        doubleValue += ([byteArr[i] integerValue] & 0xff) << (8*(1-i));
    }
//    int b = [self signedDataTointWithData:characteristic.value Location:0 Offset:2];
    doubleValue = (doubleValue / 65536) * (85.0 - (-40))+(-40);

    if ([self.delegate respondsToSelector:@selector(temperatureComplete:)]) {
        
        [self.delegate temperatureComplete:doubleValue];
    }
}

#pragma mark 连接外设——失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"%@", error);
}



#pragma mark 取消与外设的连接回调
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    NSLog(@"%@", peripheral);
}

// 转为本地大小端模式 返回Signed类型的数据
- (signed int)signedDataTointWithData:(NSData *)data Location:(NSInteger)location Offset:(NSInteger)offset {
    signed int value=0;
    NSData *intdata= [data subdataWithRange:NSMakeRange(location, offset)];
    
    if (offset==2) {
        value=CFSwapInt16BigToHost(*(int*)([intdata bytes]));
    }
    else if (offset==4) {
        value = CFSwapInt32BigToHost(*(int*)([intdata bytes]));
    }
    else if (offset==1) {
        signed char *bs = (signed char *)[[data subdataWithRange:NSMakeRange(location, 1) ] bytes];
        value = *bs;
    }
    return value;
}

//将十进制转化为十六进制
-(NSString *)ToHex:(long long int)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    long long int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%lli",ttmpig];

        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }

    }
    return str;
}

- (NSMutableDictionary *)deviceDic {
    
    if (!_deviceDic) {
        
        _deviceDic = [NSMutableDictionary dictionary];
    }
    
    return _deviceDic;
}

- (CBCentralManager *)centralManager {
    
    if (!_centralManager) {
        
        _centralManager = [[CBCentralManager alloc] init];
    }
    
    return _centralManager;
}


@end
