//
//  SQCacheManager.h
//  GuoBinTeam
//
//  Created by bing.li on 2017/3/3.
//  Copyright © 2017年 首汽约车. All rights reserved.

/*
    如果需要对象归档，在需要归档的类实现文件中导入MJExtension.h
    写入MJCodingImplementation即可，不用实现协议方法
 
    ！！！如果归档对象使用YYModel，请在模型的.m 假如以下实现
 - (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
 - (id)initWithCoder:(NSCoder *)aDecoder { return [self yy_modelInitWithCoder:aDecoder]; }
 - (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
 - (NSUInteger)hash { return [self yy_modelHash]; }
 - (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface LXCacheManager : NSObject

+ (instancetype)shareInstance;

//缓存数据

/**
 使用userDefault保存、修改数据
 */
- (void)setObjectWithUserDefaultKey:(NSString *)key withObject:(id)object;
- (void)setFloatValueWithUserDefaultKey:(NSString *)key withFloatValue:(CGFloat)value;
- (void)setBoolValueWithUserDefaultKey:(NSString *)key withBoolValue:(BOOL)judgeVaule;
- (void)setIntegerValueWithUserDefaultKey:(NSString *)key withIntegerValue:(NSInteger)value;

/**
 使用userDefault获取数据
 */
- (nullable id)objectCacheAt:(NSString *)key;
- (CGFloat)floatValueAt:(NSString *)key;
- (BOOL)boolCacheAt:(NSString *)key;
- (NSInteger)integerValueForKey:(NSString *)key;

/**
 使用userDefault清空数据
 */
- (void)clearDataWithUserDefaultAt:(NSString *)key;
- (void)clearAllDataWithUserDefault;

/*------------------------------------------------------------------------------------*/
/**
 对象归档
*/
- (BOOL)saveCacheWithArchiveForKey:(NSString *)key withObject:(id)object;

/**
 对象解归档
 */
- (nullable id)unarchiveDataForKey:(nonnull NSString *)key;

/*
 清除归档数据
 */
- (BOOL)deleteArchiveDataForKey:(NSString *)key;


@end
NS_ASSUME_NONNULL_END
