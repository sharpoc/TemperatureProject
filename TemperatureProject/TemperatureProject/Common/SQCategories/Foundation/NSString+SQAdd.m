//
//  NSString+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "NSString+SQAdd.h"
#import "NSData+SQAdd.h"
#import "NSNumber+SQAdd.h"
#import "SQCategoriesMacro.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SQAdd)

- (NSString *)sq_md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_md2String];
}

- (NSString *)sq_md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_md4String];
}

- (NSString *)sq_md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_md5String];
}

- (NSString *)sq_sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_sha1String];
}

- (NSString *)sq_sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_sha224String];
}

- (NSString *)sq_sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_sha256String];
}

- (NSString *)sq_sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_sha384String];
}

- (NSString *)sq_sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_sha512String];
}

- (NSString *)sq_crc32String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_crc32String];
}

- (NSString *)sq_hmacMD5StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacMD5StringWithKey:key];
}

- (NSString *)sq_hmacSHA1StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacSHA1StringWithKey:key];
}

- (NSString *)sq_hmacSHA224StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacSHA224StringWithKey:key];
}

- (NSString *)sq_hmacSHA256StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacSHA256StringWithKey:key];
}

- (NSString *)sq_hmacSHA384StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacSHA384StringWithKey:key];
}

- (NSString *)sq_hmacSHA512StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            sq_hmacSHA512StringWithKey:key];
}

- (NSString *)sq_base64EncodedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sq_base64EncodedString];
}

+ (NSString *)sq_stringWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData *data = [NSData sq_dataWithBase64EncodedString:base64EncodedString];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)sq_stringByURLEncode {
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
         - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
         - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
         - parameter string: The string to be percent-escaped.
         - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length) {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        return escaped;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        return encoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)sq_stringByURLDecode {
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)sq_stringByEscapingHTML {
    NSUInteger len = self.length;
    if (!len) return self;
    
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return self;
    [self getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableString *result = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        unichar c = buf[i];
        NSString *esc = nil;
        switch (c) {
            case 34: esc = @"&quot;"; break;
            case 38: esc = @"&amp;"; break;
            case 39: esc = @"&apos;"; break;
            case 60: esc = @"&lt;"; break;
            case 62: esc = @"&gt;"; break;
            default: break;
        }
        if (esc) {
            [result appendString:esc];
        } else {
            CFStringAppendCharacters((CFMutableStringRef)result, &c, 1);
        }
    }
    free(buf);
    return result;
}

- (CGSize)sq_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)sq_widthForFont:(UIFont *)font {
    CGSize size = [self sq_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGFloat)sq_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self sq_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

- (BOOL)sq_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0);
}

- (void)sq_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block {
    if (regex.length == 0 || !block) return;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!regex) return;
    [pattern enumerateMatchesInString:self options:kNilOptions range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        block([self substringWithRange:result.range], result.range, stop);
    }];
}

- (NSString *)sq_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement; {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!pattern) return self;
    return [pattern stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:replacement];
}

- (char)charValue {
    return self.sq_numberValue.charValue;
}

- (unsigned char)unsignedCharValue {
    return self.sq_numberValue.unsignedCharValue;
}

- (short)shortValue {
    return self.sq_numberValue.shortValue;
}

- (unsigned short)unsignedShortValue {
    return self.sq_numberValue.unsignedShortValue;
}

- (unsigned int)unsignedIntValue {
    return self.sq_numberValue.unsignedIntValue;
}

- (long)longValue {
    return self.sq_numberValue.longValue;
}

- (unsigned long)unsignedLongValue {
    return self.sq_numberValue.unsignedLongValue;
}

- (unsigned long long)unsignedLongLongValue {
    return self.sq_numberValue.unsignedLongLongValue;
}

- (NSUInteger)unsignedIntegerValue {
    return self.sq_numberValue.unsignedIntegerValue;
}


+ (NSString *)sq_stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

+ (NSString *)sq_stringWithUTF32Char:(UTF32Char)char32 {
    char32 = NSSwapHostIntToLittle(char32);
    return [[NSString alloc] initWithBytes:&char32 length:4 encoding:NSUTF32LittleEndianStringEncoding];
}

+ (NSString *)sq_stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length {
    return [[NSString alloc] initWithBytes:(const void *)char32
                                    length:length * 4
                                  encoding:NSUTF32LittleEndianStringEncoding];
}

- (void)sq_enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block {
    NSString *str = self;
    if (range.location != 0 || range.length != self.length) {
        str = [self substringWithRange:range];
    }
    NSUInteger len = [str lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    UTF32Char *char32 = (UTF32Char *)[str cStringUsingEncoding:NSUTF32LittleEndianStringEncoding];
    if (len == 0 || char32 == NULL) return;
    
    NSUInteger location = 0;
    BOOL stop = NO;
    NSRange subRange;
    UTF32Char oneChar;
    
    for (NSUInteger i = 0; i < len; i++) {
        oneChar = char32[i];
        subRange = NSMakeRange(location, oneChar > 0xFFFF ? 2 : 1);
        block(oneChar, subRange, &stop);
        if (stop) return;
        location += subRange.length;
    }
}

- (NSString *)sq_stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSString *)sq_stringByAppendingNameScale:(CGFloat)scale {
    if (fabs(scale - 1) <= __FLT_EPSILON__ || self.length == 0 || [self hasSuffix:@"/"]) return self.copy;
    return [self stringByAppendingFormat:@"@%@x", @(scale)];
}

- (NSString *)sq_stringByAppendingPathScale:(CGFloat)scale {
    if (fabs(scale - 1) <= __FLT_EPSILON__ || self.length == 0 || [self hasSuffix:@"/"]) return self.copy;
    NSString *ext = self.pathExtension;
    NSRange extRange = NSMakeRange(self.length - ext.length, 0);
    if (ext.length > 0) extRange.location -= 1;
    NSString *scaleStr = [NSString stringWithFormat:@"@%@x", @(scale)];
    return [self stringByReplacingCharactersInRange:extRange withString:scaleStr];
}

- (CGFloat)sq_pathScale {
    if (self.length == 0 || [self hasSuffix:@"/"]) return 1;
    NSString *name = self.stringByDeletingPathExtension;
    __block CGFloat scale = 1;
    [name sq_enumerateRegexMatches:@"@[0-9]+\\.?[0-9]*x$" options:NSRegularExpressionAnchorsMatchLines usingBlock: ^(NSString *match, NSRange matchRange, BOOL *stop) {
        scale = [match substringWithRange:NSMakeRange(1, match.length - 2)].doubleValue;
    }];
    return scale;
}

- (BOOL)sq_isBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)sq_isBlankString:(NSString *)string {
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isEqual:nil]
        || [string isEqual:Nil]){
        return YES;
    }
    
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (0 == [string length]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"null"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)sq_containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)sq_containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}

- (NSNumber *)sq_numberValue {
    return [NSNumber sq_numberWithString:self];
}

- (NSData *)sq_dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSRange)sq_rangeOfAll {
    return NSMakeRange(0, self.length);
}

- (id)sq_jsonValueDecoded {
    return [[self sq_dataValue] sq_jsonValueDecoded];
}

+ (NSString *)sq_stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

+ (NSString *)sq_safeString:(NSString *)srcStr {
    if ([NSString sq_isBlankString:srcStr]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", srcStr];
}

- (BOOL)sq_isValidPhoneNumber {
    NSString *Regex = @"(13[0-9]|14[57]|15[012356789]|17[0-9]|18[0-9])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:self];
}

- (BOOL)sq_isValidEmail {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)sq_isValidURLAddress {
    if(self == nil)  return NO;
    NSString *urlRegex = @"(https|http|ftp|rtsp|igmp|file|rtspt|rtspu)://((((25[0-5]|2[0-4]\\d|1?\\d?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1?\\d?\\d))|([0-9a-z_!~*'()-]*\\.?))([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\.([a-z]{2,6})(:[0-9]{1,4})?([a-zA-Z/?_=]*)\\.\\w{1,5}";
    NSPredicate* urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    return [urlTest evaluateWithObject:self];
}
@end
