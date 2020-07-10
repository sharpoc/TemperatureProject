//
//  NSBundle+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "NSBundle+SQAdd.h"
#import "SQCategoriesMacro.h"
#import "NSString+SQAdd.h"

@implementation NSBundle (SQAdd)

+ (NSArray *)sq_preferredScales {
    static NSArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat screenScale = [UIScreen mainScreen].scale;
        if (screenScale <= 1) {
            scales = @[@1,@2,@3];
        } else if (screenScale <= 2) {
            scales = @[@2,@3,@1];
        } else {
            scales = @[@3,@2,@1];
        }
    });
    return scales;
}

+ (NSString *)sq_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext inDirectory:bundlePath];
    
    NSString *path = nil;
    NSArray *scales = [self sq_preferredScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name sq_stringByAppendingNameScale:scale]
        : [name sq_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext inDirectory:bundlePath];
        if (path) break;
    }
    
    return path;
}

- (NSString *)sq_pathForScaledResource:(NSString *)name ofType:(NSString *)ext {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext];
    
    NSString *path = nil;
    NSArray *scales = [NSBundle sq_preferredScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name sq_stringByAppendingNameScale:scale]
        : [name sq_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext];
        if (path) break;
    }
    
    return path;
}

- (NSString *)sq_pathForScaledResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath {
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return [self pathForResource:name ofType:ext];
    
    NSString *path = nil;
    NSArray *scales = [NSBundle sq_preferredScales];
    for (int s = 0; s < scales.count; s++) {
        CGFloat scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = ext.length ? [name sq_stringByAppendingNameScale:scale]
        : [name sq_stringByAppendingPathScale:scale];
        path = [self pathForResource:scaledName ofType:ext inDirectory:subpath];
        if (path) break;
    }
    
    return path;
}

#pragma mark -Localization
+ (instancetype)sq_Bundle
{
    static NSBundle *refreshBundle = nil;
    if (refreshBundle == nil) {
        refreshBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"SQYCLocalization" ofType:@"bundle"]];
    }
    return refreshBundle;
}

+ (NSString *)sq_localizedStringForKey:(NSString *)key
{
    return [self sq_localizedStringForKey:key value:nil bundle:nil];
}

+ (NSString *)sq_localizedStringForKey:(NSString *)key value:(NSString *)value bundle:(NSBundle *)bundle
{
    static NSBundle *localizedBundle = nil;
    //判断bundle语言和App语言是否一致
    BOOL isBundleLanguageDiff = [self isBundleLanguageDifferrent:localizedBundle];
    
    if (localizedBundle == nil || isBundleLanguageDiff) {
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans"; // 简体中文
            } else { // zh-Hant\zh-HK\zh-TW
                language = @"zh-Hant"; // 繁體中文
            }
        } else {
            language = @"en";
        }
        if (bundle == nil) {
            bundle = [NSBundle sq_Bundle];
        }
        // 从SQYCLocalization.bundle中查找资源
        localizedBundle = [NSBundle bundleWithPath:[bundle pathForResource:language ofType:@"lproj"]];
    }
    value = [localizedBundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

+ (BOOL)isBundleLanguageDifferrent:(NSBundle *)bundleName {
    NSString *language = [NSLocale preferredLanguages].firstObject;
    if ([language hasPrefix:@"en"]) {
        language = @"en";
    } else if ([language hasPrefix:@"zh"]) {
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            language = @"zh-Hans"; // 简体中文
        } else { // zh-Hant\zh-HK\zh-TW
            language = @"zh-Hant"; // 繁體中文
        }
    } else {
        language = @"en";
    }
    
    NSString *bundlePath = bundleName.bundlePath;
    NSString *langugeFile = [NSString stringWithFormat:@"%@.lproj", language];
    if (bundlePath.length > 0 &&
        [bundlePath hasSuffix:langugeFile]) {
        return NO;
    }
    return YES;
}
@end
