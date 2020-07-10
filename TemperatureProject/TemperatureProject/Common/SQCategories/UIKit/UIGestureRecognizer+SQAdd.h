//
//  UIGestureRecognizer+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/19.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIGestureRecognizer (SQAdd)

/**
 Initializes an allocated gesture-recognizer object with a action block.
 
 @param block  An action block that to handle the gesture recognized by the
 receiver. nil is invalid. It is retained by the gesture.
 
 @return An initialized instance of a concrete UIGestureRecognizer subclass or
 nil if an error occurred in the attempt to initialize the object.
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))block;

/**
 Adds an action block to a gesture-recognizer object. It is retained by the
 gesture.
 
 @param block A block invoked by the action message. nil is not a valid value.
 */
- (void)sq_addActionBlock:(void (^)(id sender))block;

/**
 Remove all action blocks.
 */
- (void)sq_removeAllActionBlocks;
@end

NS_ASSUME_NONNULL_END
