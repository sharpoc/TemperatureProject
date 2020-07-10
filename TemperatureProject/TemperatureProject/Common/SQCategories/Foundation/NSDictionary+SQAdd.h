//
//  NSDictionary+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SQAdd)

#pragma mark - Dictionary Convertor
///=============================================================================
/// @name Dictionary Convertor
///=============================================================================

/**
 Creates and returns a dictionary from a specified property list data.
 
 @param plist   A property list data whose root object is a dictionary.
 @return A new dictionary created from the plist data, or nil if an error occurs.
 */
+ (nullable NSDictionary *)sq_dictionaryWithPlistData:(NSData *_Nullable)plist;

/**
 Creates and returns a dictionary from a specified property list xml string.
 
 @param plist   A property list xml string whose root object is a dictionary.
 @return A new dictionary created from the plist string, or nil if an error occurs.
 
 @discussion Apple has implemented this method, but did not make it public.
 */
+ (nullable NSDictionary *)sq_dictionaryWithPlistString:(NSString *_Nullable)plist;

/**
 Serialize the dictionary to a binary property list data.
 
 @return A bplist data, or nil if an error occurs.
 
 @discussion Apple has implemented this method, but did not make it public.
 */
- (nullable NSData *)sq_plistData;

/**
 Serialize the dictionary to a xml property list string.
 
 @return A plist xml string, or nil if an error occurs.
 */
- (nullable NSString *)sq_plistString;

/**
 Returns a new array containing the dictionary's keys sorted.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *_Nullable)sq_allKeysSorted;

/**
 Returns a new array containing the dictionary's values sorted by keys.
 
 The order of the values in the array is defined by keys.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's values sorted by keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *_Nullable)sq_allValuesSortedByKeys;

/**
 Returns a BOOL value tells if the dictionary has an object for key.
 
 @param key The key.
 */
- (BOOL)sq_containsObjectForKey:(id _Nullable )key;

/**
 Returns a new dictionary containing the entries for keys.
 If the keys is empty or nil, it just returns an empty dictionary.
 
 @param keys The keys.
 @return The entries for the keys.
 */
- (NSDictionary *_Nullable)sq_entriesForKeys:(NSArray *_Nullable)keys;

/**
 Convert dictionary to json string. return nil if an error occurs.
 */
- (nullable NSString *)sq_jsonStringEncoded;

/**
 Convert dictionary to json string formatted. return nil if an error occurs.
 */
- (nullable NSString *)sq_jsonPrettyStringEncoded;

/**
 Try to parse an XML and wrap it into a dictionary.
 If you just want to get some value from a small xml, try this.
 
 example XML: "<config><a href="test.com">link</a></config>"
 example Return: @{@"_name":@"config", @"a":{@"_text":@"link",@"href":@"test.com"}}
 
 @param xmlDataOrString XML in NSData or NSString format.
 @return Return a new dictionary, or nil if an error occurs.
 */
+ (nullable NSDictionary *)sq_dictionaryWithXML:(id _Nullable )xmlDataOrString;

#pragma mark - Dictionary Value Getter
///=============================================================================
/// @name Dictionary Value Getter
///=============================================================================

- (BOOL)sq_boolValueForKey:(NSString *_Nullable)key default:(BOOL)def;

- (char)sq_charValueForKey:(NSString *_Nullable)key default:(char)def;
- (unsigned char)sq_unsignedCharValueForKey:(NSString *_Nullable)key default:(unsigned char)def;

- (short)sq_shortValueForKey:(NSString *_Nullable)key default:(short)def;
- (unsigned short)sq_unsignedShortValueForKey:(NSString *_Nullable)key default:(unsigned short)def;

- (int)sq_intValueForKey:(NSString *_Nullable)key default:(int)def;
- (unsigned int)sq_unsignedIntValueForKey:(NSString *_Nullable)key default:(unsigned int)def;

- (long)sq_longValueForKey:(NSString *_Nullable)key default:(long)def;
- (unsigned long)sq_unsignedLongValueForKey:(NSString *_Nullable)key default:(unsigned long)def;

- (long long)sq_longLongValueForKey:(NSString *_Nullable)key default:(long long)def;
- (unsigned long long)sq_unsignedLongLongValueForKey:(NSString *_Nullable)key default:(unsigned long long)def;

- (float)sq_floatValueForKey:(NSString *_Nullable)key default:(float)def;
- (double)sq_doubleValueForKey:(NSString *_Nullable)key default:(double)def;

- (NSInteger)sq_integerValueForKey:(NSString *_Nullable)key default:(NSInteger)def;
- (NSUInteger)sq_unsignedIntegerValueForKey:(NSString *_Nullable)key default:(NSUInteger)def;

- (nullable NSNumber *)sq_numberValueForKey:(NSString *_Nullable)key default:(nullable NSNumber *)def;
- (nullable NSString *)sq_stringValueForKey:(NSString *_Nullable)key default:(nullable NSString *)def;

@end

@interface NSMutableDictionary (SQAdd)

/**
 Set object for key by safe.

 @param anObject object
 @param aKey key
 */
- (void)sq_setObject:(id _Nullable )anObject forKey:(id<NSCopying> _Nullable)aKey;

/**
 Creates and returns a dictionary from a specified property list data.
 
 @param plist   A property list data whose root object is a dictionary.
 @return A new dictionary created from the plist data, or nil if an error occurs.
 
 @discussion Apple has implemented this method, but did not make it public.
 */
+ (nullable NSMutableDictionary *)sq_dictionaryWithPlistData:(NSData *_Nullable)plist;

/**
 Creates and returns a dictionary from a specified property list xml string.
 
 @param plist   A property list xml string whose root object is a dictionary.
 @return A new dictionary created from the plist string, or nil if an error occurs.
 */
+ (nullable NSMutableDictionary *)sq_dictionaryWithPlistString:(NSString *_Nullable)plist;


/**
 Removes and returns the value associated with a given key.
 
 @param aKey The key for which to return and remove the corresponding value.
 @return The value associated with aKey, or nil if no value is associated with aKey.
 */
- (nullable id)sq_popObjectForKey:(id _Nullable )aKey;

/**
 Returns a new dictionary containing the entries for keys, and remove these
 entries from reciever. If the keys is empty or nil, it just returns an
 empty dictionary.
 
 @param keys The keys.
 @return The entries for the keys.
 */
- (NSDictionary *_Nullable)sq_popEntriesForKeys:(NSArray *_Nullable)keys;
@end
