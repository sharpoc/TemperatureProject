//
//  NSThread+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (SQAdd)

/**
 Add an autorelease pool to current runloop for current thread.
 
 @discussion If you create your own thread (NSThread/pthread), and you use
 runloop to manage your task, you may use this method to add an autorelease pool
 to the runloop. Its behavior is the same as the main thread's autorelease pool.
 */
+ (void)sq_addAutoreleasePoolToCurrentRunloop;

@end
