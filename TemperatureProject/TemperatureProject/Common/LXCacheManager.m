//
//  SQCacheManager.m
//  GuoBinTeam
//
//  Created by bing.li on 2017/3/3.
//  Copyright © 2017年 首汽约车. All rights reserved.
//

#import "LXCacheManager.h"

@interface LXCacheManager ()

@property (nonatomic,strong) NSUserDefaults *userDefault;

@end


NSString *const APPGroupID = @"group.01zhuanche";
static LXCacheManager *manager;

@implementation LXCacheManager

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[LXCacheManager alloc] init];
        
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userDefault = [[NSUserDefaults alloc] initWithSuiteName:APPGroupID];
    }
    return self;
}

//缓存数据
- (void)setObjectWithUserDefaultKey:(NSString *)key withObject:(id)object {
    if (key.length == 0) {
        return;
    }
    [self.userDefault setObject:object forKey:key];
    [self.userDefault synchronize];
}

- (void)setBoolValueWithUserDefaultKey:(NSString *)key withBoolValue:(BOOL)judgeVaule {
    if (key.length == 0) {
        return;
    }
    [self.userDefault setBool:judgeVaule forKey:key];
    [self.userDefault synchronize];
}

- (void)setFloatValueWithUserDefaultKey:(NSString *)key withFloatValue:(CGFloat)value {
    
    if (key.length == 0) {
        return;
    }
    
    [self.userDefault setDouble:value forKey:key];
    [self.userDefault synchronize];
    
}

- (void)setIntegerValueWithUserDefaultKey:(NSString *)key withIntegerValue:(NSInteger)value {
    if (key.length == 0) {
        return;
    }
    
    [self.userDefault setInteger:value forKey:key];
    [self.userDefault synchronize];
}

//获取数据
- (nullable id)objectCacheAt:(NSString *)key {
    if (key.length == 0) {
        return nil;
    }
    
    return [self.userDefault objectForKey:key];
}

- (BOOL)boolCacheAt:(NSString *)key {

    return [self.userDefault boolForKey:key];
}

- (CGFloat)floatValueAt:(NSString *)key {
    
    return [self.userDefault doubleForKey:key];
}

- (NSInteger)integerValueForKey:(NSString *)key {
    return [self.userDefault integerForKey:key];
}

/**
 使用userDefault清空数据
 */
- (void)clearDataWithUserDefaultAt:(NSString *)key {
    if (key.length == 0) {
        return;
    }
    
    [self.userDefault removeObjectForKey:key];
    [self.userDefault synchronize];
}

//清空所有数据
- (void)clearAllDataWithUserDefault {
    
    NSDictionary *dictionary = [self.userDefault dictionaryRepresentation];
    for(NSString *key in [dictionary allKeys]){
        [self.userDefault removeObjectForKey:key];
    }
    [self.userDefault synchronize];
    
}

/**
 对象归档
 */
- (BOOL)saveCacheWithArchiveForKey:(NSString *)key withObject:(id)object {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *homePath = [documentPath stringByAppendingFormat:@"/%@.archiver",key];
    BOOL flag = [NSKeyedArchiver archiveRootObject:object toFile:homePath];
    return flag;
}

/**
 对象解归档
 */
- (nullable id)unarchiveDataForKey:(nonnull NSString *)key {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *homePath = [documentPath stringByAppendingFormat:@"/%@.archiver",key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:homePath];
}


/*
 清除归档数据
 */
- (BOOL)deleteArchiveDataForKey:(NSString *)key {
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingFormat:@"/%@.archiver",key];
    
    NSFileManager *fmanager=[NSFileManager defaultManager];
    return [fmanager removeItemAtPath:filePath error:nil];
}




@end
