//
//  LXInputView.h
//  TemperatureProject
//
//  Created by admin on 2020/6/23.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXInputView : UIView

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *placeHolderText;
@property (nonatomic,strong) UITextField *inputTextField;
@property (nonatomic,strong) UIImage *image;


@end

NS_ASSUME_NONNULL_END
