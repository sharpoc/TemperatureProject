//
//  NSObject+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SQAdd)

/**
 Judge an object is empty or not.

 @param o object
 @return Empty or not
 */
+ (BOOL)sq_isEmpty:(NSObject *_Nullable)o;

#pragma mark -swizzling
/**
 Swap two instance method's implementation in one class. Dangerous, be careful.
 
 @param originalSel   Selector 1.
 @param newSel        Selector 2.
 @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)sq_swizzleInstanceMethod:(SEL _Nonnull )originalSel with:(SEL _Nonnull )newSel;

/**
 Swap two class method's implementation in one class. Dangerous, be careful.
 
 @param originalSel   Selector 1.
 @param newSel        Selector 2.
 @return              YES if swizzling succeed; otherwise, NO.
 */
+ (BOOL)sq_swizzleClassMethod:(SEL _Nonnull )originalSel with:(SEL _Nonnull )newSel;

#pragma mark -Associate value

/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 
 @param value   The object to associate.
 @param key     The pointer to get value from `self`.
 */
- (void)sq_setAssociateValue:(nullable id)value withKey:(void *_Nonnull)key;

/**
 Associate one object to `self`, as if it was a weak property (week, nonatomic).
 
 @param value  The object to associate.
 @param key    The pointer to get value from `self`.
 */
- (void)sq_setAssociateWeakValue:(nullable id)value withKey:(void *_Nonnull)key;

/**
 Get the associated value from `self`.
 
 @param key The pointer to get value from `self`.
 */
- (nullable id)sq_getAssociatedValueForKey:(void *_Nonnull)key;

/**
 Remove all associated values.
 */
- (void)sq_removeAssociatedValues;


#pragma mark - Others

/**
 Returns the class name in NSString.
 */
+ (NSString *_Nullable)sq_className;

/**
 Returns the class name in NSString.
 
 @discussion Apple has implemented this method in NSObject(NSLayoutConstraintCallsThis),
 but did not make it public.
 */
- (NSString *_Nullable)sq_className;

@end
