//
//  LXAPI.h
//  TemperatureProject
//
//  Created by admin on 2020/8/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LXURLHandler.h"

#define GetURL(SUBURL) [LXURLHandler formateURL:SUBURL]


UIKIT_EXTERN NSString *const URL_login;
UIKIT_EXTERN NSString *const URL_sendCode;
UIKIT_EXTERN NSString *const URL_userRegister;
UIKIT_EXTERN NSString *const URL_addDevice;
UIKIT_EXTERN NSString *const URL_uploadTemperature;
UIKIT_EXTERN NSString *const URL_temperature;
UIKIT_EXTERN NSString *const URL_resetPassword;
UIKIT_EXTERN NSString *const URL_updateCname;
UIKIT_EXTERN NSString *const URL_inAppGroup;
UIKIT_EXTERN NSString *const URL_getDevice;
UIKIT_EXTERN NSString *const URL_removeDevice;
UIKIT_EXTERN NSString *const URL_updateDevice;
