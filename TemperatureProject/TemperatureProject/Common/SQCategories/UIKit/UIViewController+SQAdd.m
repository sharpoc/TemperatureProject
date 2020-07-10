//
//  UIViewController+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/19.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "UIViewController+SQAdd.h"
#import <objc/runtime.h>

@implementation UIViewController (SQAdd)

- (BOOL)isVisible {
    BOOL isVisible = [objc_getAssociatedObject(self, _cmd) boolValue];
    return isVisible;
}

- (void)setIsVisible:(BOOL)isVisible {
    objc_setAssociatedObject(self, @selector(isVisible), @(isVisible), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isInEditting {
    BOOL isInEditting = [objc_getAssociatedObject(self, _cmd) boolValue];
    return isInEditting;
}

- (void)setIsInEditting:(BOOL)isInEditting {
    objc_setAssociatedObject(self, @selector(isInEditting), @(isInEditting), OBJC_ASSOCIATION_ASSIGN);
}

- (id)firstResponder {
    id firstResponder = objc_getAssociatedObject(self, _cmd);
    return firstResponder;
}

- (void)setFirstResponder:(id)firstResponder {
    objc_setAssociatedObject(self, @selector(firstResponder), firstResponder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
