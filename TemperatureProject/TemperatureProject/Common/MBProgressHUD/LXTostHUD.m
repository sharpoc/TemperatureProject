//
//  LXTostHUD.m
//  TemperatureProject
//
//  Created by admin on 2020/6/30.
//  Copyright © 2020 admin. All rights reserved.
//

#import "LXTostHUD.h"
#import "MBProgressHUD.h"

@implementation LXTostHUD

+ (void)showTitle:(NSString *)text {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIView *superView =[UIApplication sharedApplication].keyWindow;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
        hud.frame = CGRectMake(0, kSQYCNavigationBarHeight, KScreenWidth, KScreenHeight - kSQYCNavigationBarHeight);
        hud.contentColor = [UIColor whiteColor];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        if (text && text.length > 0) {
            hud.label.text = text;
            hud.label.numberOfLines = 0;
            hud.label.font = [UIFont systemFontOfSize:14];
            hud.label.textColor = [UIColor whiteColor];
            
            hud.mode = MBProgressHUDModeText;
            hud.margin = 16;
        
        }
        [hud hideAnimated:YES afterDelay:2];
    });
}
@end
