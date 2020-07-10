//
//  SQCategories.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<SQCategories/SQCategories.h>)
FOUNDATION_EXPORT double SQCategoriesVersionNumber;
FOUNDATION_EXPORT const unsigned char SQCategoriesVersionString[];
#import <SQCategories/SQCategoriesMacro.h>
#import <SQCategories/NSArray+SQAdd.h>
#import <SQCategories/NSBundle+SQAdd.h>
#import <SQCategories/NSData+SQAdd.h>
#import <SQCategories/NSDate+SQAdd.h>
#import <SQCategories/NSTimer+SQAdd.h>
#import <SQCategories/NSString+SQAdd.h>
#import <SQCategories/NSObject+SQAdd.h>
#import <SQCategories/NSThread+SQAdd.h>
#import <SQCategories/NSNumber+SQAdd.h>
#import <SQCategories/NSDictionary+SQAdd.h>
#import <SQCategories/NSKeyedUnarchiver+SQAdd.h>
#import <SQCategories/NSNotificationCenter+SQAdd.h>
#import <SQCategories/UIView+SQAdd.h>
#import <SQCategories/UIImage+SQAdd.h>
#import <SQCategories/UIScreen+SQAdd.h>
#import <SQCategories/UIDevice+SQAdd.h>
#import <SQCategories/UIControl+SQAdd.h>
#import <SQCategories/UIColor+SQAdd.h>
#import <SQCategories/UIFont+SQAdd.h>
#import <SQCategories/UIApplication+SQAdd.h>
#import <SQCategories/UIGestureRecognizer+SQAdd.h>
#import <SQCategories/UIViewController+SQAdd.h>
#import <SQCategories/UITableViewCell+SQAdd.h>
#import <SQCategories/UITextField+SQAdd.h>
#import <SQCategories/CALayer+SQAdd.h>
#import <SQCategories/SQCGUtilities.h>
#else
#import "SQCategoriesMacro.h"
#import "NSArray+SQAdd.h"
#import "NSBundle+SQAdd.h"
#import "NSData+SQAdd.h"
#import "NSDate+SQAdd.h"
#import "NSTimer+SQAdd.h"
#import "NSString+SQAdd.h"
#import "NSObject+SQAdd.h"
#import "NSThread+SQAdd.h"
#import "NSNumber+SQAdd.h"
#import "NSDictionary+SQAdd.h"
#import "NSKeyedUnarchiver+SQAdd.h"
#import "NSNotificationCenter+SQAdd.h"
#import "UIView+SQAdd.h"
#import "UIImage+SQAdd.h"
#import "UIScreen+SQAdd.h"
#import "UIDevice+SQAdd.h"
#import "UIControl+SQAdd.h"
#import "UIColor+SQAdd.h"
#import "UIFont+SQAdd.h"
#import "UIApplication+SQAdd.h"
#import "UIGestureRecognizer+SQAdd.h"
#import "UIViewController+SQAdd.h"
#import "UITableViewCell+SQAdd.h"
#import "UITextField+SQAdd.h"
#import "CALayer+SQAdd.h"
#import "SQCGUtilities.h"
#endif
