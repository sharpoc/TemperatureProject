//
//  NSObject+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "NSObject+SQAdd.h"
#import "NSString+SQAdd.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation NSObject (SQAdd)
+ (BOOL)sq_isEmpty:(NSObject *)o {
    if (o == nil) {
        return YES;
    }
    
    if (o == NULL) {
        return YES;
    }
    
    if (o == [NSNull new]) {
        return YES;
    }
    
    if ([o isKindOfClass:[NSString class]]) {
        return [NSString sq_isBlankString:(NSString *)o];
    }
    
    if ([o isKindOfClass:[NSData class]]) {
        return [((NSData *)o) length]<=0;
    }
    
    if ([o isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)o) count] <= 0;
    }
    
    if ([o isKindOfClass:[NSArray class]]) {
        return [((NSArray *)o) count] <= 0;
    }
    
    if ([o isKindOfClass:[NSSet class]]) {
        return [((NSSet *)o) count] <= 0;
    }
    
    return NO;
}

#pragma mark -swizzling
+ (BOOL)sq_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)sq_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

#pragma mark -Associate value
- (void)sq_setAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sq_setAssociateWeakValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (void)sq_removeAssociatedValues {
    objc_removeAssociatedObjects(self);
}

- (id)sq_getAssociatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

#pragma mark - Others
+ (NSString *)sq_className {
    return NSStringFromClass(self);
}

- (NSString *)sq_className {
    return [NSString stringWithUTF8String:class_getName([self class])];
}
@end
