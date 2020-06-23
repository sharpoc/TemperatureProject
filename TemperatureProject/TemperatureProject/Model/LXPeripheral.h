//
//  LxPeripheral.h
//  TemperatureProject
//
//  Created by admin on 2020/6/23.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBPeripheral;

@interface LXPeripheral : NSObject

@property (nonatomic,strong) CBPeripheral *peripheral;
@property (nonatomic,copy) NSString *peripheralName;
@property (nonatomic,copy) NSString *mac;
@end

