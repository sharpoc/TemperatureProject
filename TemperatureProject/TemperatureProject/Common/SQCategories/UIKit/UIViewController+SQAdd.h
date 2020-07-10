//
//  UIViewController+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/19.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SQAdd)
// 正处于可见状态
@property(nonatomic, assign) BOOL isVisible;

// 第一响应者
@property(nonatomic, weak) id firstResponder;

// 保存编辑状态，当返回时，检查键盘是否需要弹起
@property(nonatomic, assign) BOOL isInEditting;
@end
