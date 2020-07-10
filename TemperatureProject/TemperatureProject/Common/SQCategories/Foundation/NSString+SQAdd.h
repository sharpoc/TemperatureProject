//
//  NSString+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SQAdd)

#pragma mark -Hash

/**
 Returns a lowercase NSString for md2 hash.
 */
- (nullable NSString *)sq_md2String;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (nullable NSString *)sq_md4String;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (nullable NSString *)sq_md5String;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (nullable NSString *)sq_sha1String;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (nullable NSString *)sq_sha224String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (nullable NSString *)sq_sha256String;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (nullable NSString *)sq_sha384String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (nullable NSString *)sq_sha512String;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacMD5StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacSHA1StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacSHA224StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacSHA256StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacSHA384StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (nullable NSString *)sq_hmacSHA512StringWithKey:(NSString *_Nullable)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (nullable NSString *)sq_crc32String;


#pragma mark - Encode and decode

/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)sq_base64EncodedString;

/**
 Returns an NSString from base64 encoded string.
 @param base64EncodedString The encoded string.
 */
+ (nullable NSString *)sq_stringWithBase64EncodedString:(NSString *_Nullable)base64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *_Nullable)sq_stringByURLEncode;

/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *_Nullable)sq_stringByURLDecode;

/**
 Escape commmon HTML to Entity.
 Example: "a>b" will be escape to "a&gt;b".
 */
- (NSString *_Nullable)sq_stringByEscapingHTML;

#pragma mark - Drawing

/**
 Returns the size of the string if it were rendered with the specified constraints.
 
 @param font          The font to use for computing the string size.
 
 @param size          The maximum acceptable size for the string. This value is
 used to calculate where line breaks and wrapping would occur.
 
 @param lineBreakMode The line break options for computing the size of the string.
 For a list of possible values, see NSLineBreakMode.
 
 @return              The width and height of the resulting string's bounding box.
 These values may be rounded up to the nearest whole number.
 */
- (CGSize)sq_sizeForFont:(UIFont *_Nullable)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 Returns the width of the string if it were to be rendered with the specified
 font on a single line.
 
 @param font  The font to use for computing the string width.
 
 @return      The width of the resulting string's bounding box. These values may be
 rounded up to the nearest whole number.
 */
- (CGFloat)sq_widthForFont:(UIFont *_Nullable)font;

/**
 Returns the height of the string if it were rendered with the specified constraints.
 
 @param font   The font to use for computing the string size.
 
 @param width  The maximum acceptable width for the string. This value is used
 to calculate where line breaks and wrapping would occur.
 
 @return       The height of the resulting string's bounding box. These values
 may be rounded up to the nearest whole number.
 */
- (CGFloat)sq_heightForFont:(UIFont *_Nullable)font width:(CGFloat)width;


#pragma mark - Regular Expression

/**
 Whether it can match the regular expression
 
 @param regex  The regular expression
 @param options     The matching options to report.
 @return YES if can match the regex; otherwise, NO.
 */
- (BOOL)sq_matchesRegex:(NSString *_Nullable)regex options:(NSRegularExpressionOptions)options;

/**
 Match the regular expression, and executes a given block using each object in the matches.
 
 @param regex    The regular expression
 @param options  The matching options to report.
 @param block    The block to apply to elements in the array of matches.
 The block takes four arguments:
 match: The match substring.
 matchRange: The matching options.
 stop: A reference to a Boolean value. The block can set the value
 to YES to stop further processing of the array. The stop
 argument is an out-only argument. You should only ever set
 this Boolean to YES within the Block.
 */
- (void)sq_enumerateRegexMatches:(NSString *_Nullable)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^_Nullable)(NSString * _Nullable match, NSRange matchRange, BOOL * _Nullable stop))block;

/**
 Returns a new string containing matching regular expressions replaced with the template string.
 
 @param regex       The regular expression
 @param options     The matching options to report.
 @param replacement The substitution template used when replacing matching instances.
 
 @return A string with matching regular expressions replaced by the template string.
 */
- (NSString *_Nullable)sq_stringByReplacingRegex:(NSString *_Nullable)regex
                             options:(NSRegularExpressionOptions)options
                                   withString:(NSString *_Nullable)replacement;


#pragma mark - NSNumber Compatible

// Now you can use NSString as a NSNumber.
@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) NSUInteger unsignedIntegerValue;


#pragma mark - Utilities

/**
 Returns a new UUID NSString
 e.g. "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 */
+ (NSString *_Nullable)sq_stringWithUUID;

/**
 Returns a string containing the characters in a given UTF32Char.
 
 @param char32 A UTF-32 character.
 @return A new string, or nil if the character is invalid.
 */
+ (NSString *_Nullable)sq_stringWithUTF32Char:(UTF32Char)char32;

/**
 Returns a string containing the characters in a given UTF32Char array.
 
 @param char32 An array of UTF-32 character.
 @param length The character count in array.
 @return A new string, or nil if an error occurs.
 */
+ (NSString *_Nullable)sq_stringWithUTF32Chars:(const UTF32Char *_Nullable)char32 length:(NSUInteger)length;

/**
 Enumerates the unicode characters (UTF-32) in the specified range of the string.
 
 @param range The range within the string to enumerate substrings.
 @param block The block executed for the enumeration. The block takes four arguments:
 char32: The unicode character.
 range: The range in receiver. If the range.length is 1, the character is in BMP;
 otherwise (range.length is 2) the character is in none-BMP Plane and stored
 by a surrogate pair in the receiver.
 stop: A reference to a Boolean value that the block can use to stop the enumeration
 by setting *stop = YES; it should not touch *stop otherwise.
 */
- (void)sq_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^_Nullable)(UTF32Char char32, NSRange range, BOOL * _Nullable stop))block;

/**
 Trim blank characters (space and newline) in head and tail.
 @return the trimmed string.
 */
- (NSString *_Nullable)sq_stringByTrim;

/**
 Add scale modifier to the file name (without path extension),
 From @"name" to @"name@2x".
 
 e.g.
 <table>
 <tr><th>Before     </th><th>After(scale:2)</th></tr>
 <tr><td>"icon"     </td><td>"icon@2x"     </td></tr>
 <tr><td>"icon "    </td><td>"icon @2x"    </td></tr>
 <tr><td>"icon.top" </td><td>"icon.top@2x" </td></tr>
 <tr><td>"/p/name"  </td><td>"/p/name@2x"  </td></tr>
 <tr><td>"/path/"   </td><td>"/path/"      </td></tr>
 </table>
 
 @param scale Resource scale.
 @return String by add scale modifier, or just return if it's not end with file name.
 */
- (NSString *_Nullable)sq_stringByAppendingNameScale:(CGFloat)scale;

/**
 Add scale modifier to the file path (with path extension),
 From @"name.png" to @"name@2x.png".
 
 e.g.
 <table>
 <tr><th>Before     </th><th>After(scale:2)</th></tr>
 <tr><td>"icon.png" </td><td>"icon@2x.png" </td></tr>
 <tr><td>"icon..png"</td><td>"icon.@2x.png"</td></tr>
 <tr><td>"icon"     </td><td>"icon@2x"     </td></tr>
 <tr><td>"icon "    </td><td>"icon @2x"    </td></tr>
 <tr><td>"icon."    </td><td>"icon.@2x"    </td></tr>
 <tr><td>"/p/name"  </td><td>"/p/name@2x"  </td></tr>
 <tr><td>"/path/"   </td><td>"/path/"      </td></tr>
 </table>
 
 @param scale Resource scale.
 @return String by add scale modifier, or just return if it's not end with file name.
 */
- (NSString *_Nullable)sq_stringByAppendingPathScale:(CGFloat)scale;

/**
 Return the path scale.
 
 e.g.
 <table>
 <tr><th>Path            </th><th>Scale </th></tr>
 <tr><td>"icon.png"      </td><td>1     </td></tr>
 <tr><td>"icon@2x.png"   </td><td>2     </td></tr>
 <tr><td>"icon@2.5x.png" </td><td>2.5   </td></tr>
 <tr><td>"icon@2x"       </td><td>1     </td></tr>
 <tr><td>"icon@2x..png"  </td><td>1     </td></tr>
 <tr><td>"icon@2x.png/"  </td><td>1     </td></tr>
 </table>
 */
- (CGFloat)sq_pathScale;

/**
 nil, @"", @"  ", @"\n" will Returns YES; otherwise Returns NO.
 */
- (BOOL)sq_isBlank;

/**
 Judge an string is blank or not.
 
 @param string a string
 @return Emtpy or not.
 */
+ (BOOL)sq_isBlankString:(NSString *_Nullable)string;

/**
 Returns YES if the target string is contained within the receiver.
 @param string A string to test the the receiver.
 
 @discussion Apple has implemented this method in iOS8.
 */
- (BOOL)sq_containsString:(NSString *_Nullable)string;

/**
 Returns YES if the target CharacterSet is contained within the receiver.
 @param set  A character set to test the the receiver.
 */
- (BOOL)sq_containsCharacterSet:(NSCharacterSet *_Nullable)set;

/**
 Try to parse this string and returns an `NSNumber`.
 @return Returns an `NSNumber` if parse succeed, or nil if an error occurs.
 */
- (NSNumber *_Nullable)sq_numberValue;

/**
 Returns an NSData using UTF-8 encoding.
 */
- (NSData *_Nullable)sq_dataValue;

/**
 Returns NSMakeRange(0, self.length).
 */
- (NSRange)sq_rangeOfAll;

/**
 Returns an NSDictionary/NSArray which is decoded from receiver.
 Returns nil if an error occurs.
 
 e.g. NSString: @"{"name":"a","count":2}"  => NSDictionary: @[@"name":@"a",@"count":@2]
 */
- (id _Nullable)sq_jsonValueDecoded;

/**
 Create a string from the file in main bundle (similar to [UIImage imageNamed:]).
 
 @param name The file name (in main bundle).
 
 @return A new string create from the file in UTF-8 character encoding.
 */
+ (NSString *_Nullable)sq_stringNamed:(NSString *_Nullable)name;

/**
 Returns a string from a input string.
 
 @param srcStr input string, it may be empty.
 
 @return A new string avoid null nil or other situations.
 */
+ (NSString *_Nullable)sq_safeString:(NSString *_Nullable)srcStr;

/**
 Judge if a string is phone number format.
 
 @return YES or NO.
 */
- (BOOL)sq_isValidPhoneNumber;

/**
 Judge if a string is valid email address format.
 
 @return YES or NO.
 */
- (BOOL)sq_isValidEmail;

/**
 Judge if a string is valid URL address format.
 
 @return YES or NO.
 */
- (BOOL)sq_isValidURLAddress;
@end
