//
//  NSNotificationCenter+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Provide some method for `NSNotificationCenter`
 to post notification in different thread.
 */
@interface NSNotificationCenter (SQAdd)

/**
 Posts a given notification to the receiver on main thread.
 If current thread is main thread, the notification is posted synchronized;
 otherwise, is posted asynchronized.
 
 @param notification  The notification to post.
 An exception is raised if notification is nil.
 */
- (void)sq_postNotificationOnMainThread:(NSNotification *_Nullable)notification;

/**
 Posts a given notification to the receiver on main thread.
 
 @param notification The notification to post.
 An exception is raised if notification is nil.
 
 @param wait         A Boolean that specifies whether the current thread blocks
 until after the specified notification is posted on the
 receiver on the main thread. Specify YES to block this
 thread; otherwise, specify NO to have this method return
 immediately.
 */
- (void)sq_postNotificationOnMainThread:(NSNotification *_Nullable)notification
                       waitUntilDone:(BOOL)wait;

/**
 Creates a notification with a given name and sender and posts it to the
 receiver on main thread. If current thread is main thread, the notification
 is posted synchronized; otherwise, is posted asynchronized.
 
 @param name    The name of the notification.
 
 @param object  The object posting the notification.
 */
- (void)sq_postNotificationOnMainThreadWithName:(NSString *_Nullable)name
                                      object:(nullable id)object;

/**
 Creates a notification with a given name and sender and posts it to the
 receiver on main thread. If current thread is main thread, the notification
 is posted synchronized; otherwise, is posted asynchronized.
 
 @param name      The name of the notification.
 
 @param object    The object posting the notification.
 
 @param userInfo  Information about the the notification. May be nil.
 */
- (void)sq_postNotificationOnMainThreadWithName:(NSString *_Nullable)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;

/**
 Creates a notification with a given name and sender and posts it to the
 receiver on main thread.
 
 @param name     The name of the notification.
 
 @param object   The object posting the notification.
 
 @param userInfo Information about the the notification. May be nil.
 
 @param wait     A Boolean that specifies whether the current thread blocks
 until after the specified notification is posted on the
 receiver on the main thread. Specify YES to block this
 thread; otherwise, specify NO to have this method return
 immediately.
 */
- (void)sq_postNotificationOnMainThreadWithName:(NSString *_Nullable)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;

@end
