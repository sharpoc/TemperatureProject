//
//  NSData+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SQAdd)

#pragma mark - Hash

/**
 Returns a lowercase NSString for md2 hash.
 */
- (NSString *_Nullable)sq_md2String;

/**
 Returns an NSData for md2 hash.
 */
- (NSData *_Nullable)sq_md2Data;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (NSString *_Nullable)sq_md4String;

/**
 Returns an NSData for md4 hash.
 */
- (NSData *_Nullable)sq_md4Data;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *_Nullable)sq_md5String;

/**
 Returns an NSData for md5 hash.
 */
- (NSData *_Nullable)sq_md5Data;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (NSString *_Nullable)sq_sha1String;

/**
 Returns an NSData for sha1 hash.
 */
- (NSData *_Nullable)sq_sha1Data;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (NSString *_Nullable)sq_sha224String;

/**
 Returns an NSData for sha224 hash.
 */
- (NSData *_Nullable)sq_sha224Data;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (NSString *_Nullable)sq_sha256String;

/**
 Returns an NSData for sha256 hash.
 */
- (NSData *_Nullable)sq_sha256Data;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (NSString *_Nullable)sq_sha384String;

/**
 Returns an NSData for sha384 hash.
 */
- (NSData *_Nullable)sq_sha384Data;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (NSString *_Nullable)sq_sha512String;

/**
 Returns an NSData for sha512 hash.
 */
- (NSData *_Nullable)sq_sha512Data;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacMD5StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm md5 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacMD5DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacSHA1StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm sha1 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacSHA1DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacSHA224StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm sha224 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacSHA224DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacSHA256StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm sha256 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacSHA256DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacSHA384StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm sha384 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacSHA384DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSString *_Nullable)sq_hmacSHA512StringWithKey:(NSString *_Nullable)key;

/**
 Returns an NSData for hmac using algorithm sha512 with key.
 @param key  The hmac key.
 */
- (NSData *_Nullable)sq_hmacSHA512DataWithKey:(NSData *_Nullable)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (NSString *_Nullable)sq_crc32String;

/**
 Returns crc32 hash.
 */
- (uint32_t)sq_crc32;


#pragma mark - Encrypt and Decrypt

/**
 Returns an encrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData encrypted, or nil if an error occurs.
 */
- (nullable NSData *)sq_aes256EncryptWithKey:(NSData *_Nullable)key iv:(nullable NSData *)iv;

/**
 Returns an decrypted NSData using AES.
 
 @param key   A key length of 16, 24 or 32 (128, 192 or 256bits).
 
 @param iv    An initialization vector length of 16(128bits).
 Pass nil when you don't want to use iv.
 
 @return      An NSData decrypted, or nil if an error occurs.
 */
- (nullable NSData *)sq_aes256DecryptWithkey:(NSData *_Nullable)key iv:(nullable NSData *)iv;


#pragma mark - Encode and decode

/**
 Returns string decoded in UTF8.
 */
- (nullable NSString *)sq_utf8String;

/**
 Returns a uppercase NSString in HEX.
 */
- (nullable NSString *)sq_hexString;

/**
 Returns an NSData from hex string.
 
 @param hexString   The hex string which is case insensitive.
 
 @return a new NSData, or nil if an error occurs.
 */
+ (nullable NSData *)sq_dataWithHexString:(NSString *_Nullable)hexString;

/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)sq_base64EncodedString;

/**
 Returns an NSData from base64 encoded string.
 
 @warning This method has been implemented in iOS7.
 
 @param base64EncodedString  The encoded string.
 */
+ (nullable NSData *)sq_dataWithBase64EncodedString:(NSString *_Nullable)base64EncodedString;

/**
 Returns an NSDictionary or NSArray for decoded self.
 Returns nil if an error occurs.
 */
- (nullable id)sq_jsonValueDecoded;
@end
