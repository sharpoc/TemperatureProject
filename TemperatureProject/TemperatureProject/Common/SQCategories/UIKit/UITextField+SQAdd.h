//
//  UITextField+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/19.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UITextField (SQAdd)

/**
 Set all text selected.
 */
- (void)sq_selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)sq_setSelectedRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
