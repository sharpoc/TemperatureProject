//
//  NSArray+SQAdd.m
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "NSArray+SQAdd.h"

@implementation NSArray (SQAdd)

- (id)sq_objectAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

- (NSString *)sq_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

- (NSString *)sq_jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

@end

@implementation NSMutableArray (SQAdd)

- (void)sq_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)sq_removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

#pragma clang diagnostic pop


- (id)sq_popFirstObject {
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self sq_removeFirstObject];
    }
    return obj;
}

- (id)sq_popLastObject {
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

- (void)sq_appendObject:(id)anObject {
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return;
    }
    [self addObject:anObject];
}

- (void)sq_prependObject:(id)anObject {
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return;
    }
    [self insertObject:anObject atIndex:0];
}

- (void)sq_appendObjects:(NSArray *)objects {
    if (!objects) return;
    [self addObjectsFromArray:objects];
}

- (void)sq_prependObjects:(NSArray *)objects {
    if (!objects) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)sq_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)sq_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

@end
