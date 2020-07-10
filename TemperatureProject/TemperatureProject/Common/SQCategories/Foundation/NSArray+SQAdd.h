//
//  NSArray+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SQAdd)

/**
 Returns the object located at index, or return nil when out of bounds.

 @param index The object located at index.
 @return object or nil
 */
- (nullable id)sq_objectAtIndex:(NSUInteger)index;

/**
 Convert object to json string. return nil if an error occurs.
 NSString/NSNumber/NSDictionary/NSArray
 */
- (nullable NSString *)sq_jsonStringEncoded;

/**
 Convert object to json string formatted. return nil if an error occurs.
 */
- (nullable NSString *)sq_jsonPrettyStringEncoded;
@end

@interface NSMutableArray (SQAdd)
/**
 Removes the object with the lowest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple has implemented this method, but did not make it public.
 Override for safe.
 */
- (void)sq_removeFirstObject;

/**
 Removes the object with the highest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple's implementation said it raises an NSRangeException if the
 array is empty, but in fact nothing will happen. Override for safe.
 */
- (void)sq_removeLastObject;

/**
 Removes and returns the object with the lowest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable id)sq_popFirstObject;

/**
 Removes and returns the object with the highest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable id)sq_popLastObject;

/**
 Inserts a given object at the end of the array.
 
 @param anObject The object to add to the end of the array's content.
 This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
 */
- (void)sq_appendObject:(id _Nullable )anObject;

/**
 Inserts a given object at the beginning of the array.
 
 @param anObject The object to add to the end of the array's content.
 This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
 */
- (void)sq_prependObject:(id _Nullable )anObject;

/**
 Adds the objects contained in another given array to the end of the receiving
 array's content.
 
 @param objects An array of objects to add to the end of the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 */
- (void)sq_appendObjects:(NSArray *_Nullable)objects;

/**
 Adds the objects contained in another given array to the beginnin of the receiving
 array's content.
 
 @param objects An array of objects to add to the beginning of the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 */
- (void)sq_prependObjects:(NSArray *_Nullable)objects;

/**
 Adds the objects contained in another given array at the index of the receiving
 array's content.
 
 @param objects An array of objects to add to the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 
 @param index The index in the array at which to insert objects. This value must
 not be greater than the count of elements in the array. Raises an
 NSRangeException if index is greater than the number of elements in the array.
 */
- (void)sq_insertObjects:(NSArray *_Nullable)objects atIndex:(NSUInteger)index;

/**
 Reverse the index of object in this array.
 Example: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)sq_reverse;

@end
