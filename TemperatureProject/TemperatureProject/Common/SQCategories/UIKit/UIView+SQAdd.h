//
//  UIView+SQAdd.h
//  SQCategories
//
//  Created by Jianpeng Dong on 2017/10/18.
//  Copyright © 2017年 Shou Yue Technology (Beijing) Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SQShadowDirection) {
    SQShadowDirectionTop    = 1 << 0,
    SQShadowDirectionLeft   = 1 << 1,
    SQShadowDirectionBottom = 1 << 2,
    SQShadowDirectionRight  = 1 << 3,
    SQShadowDirectionAll    = 0xFF
};

@interface UIView (SQAdd)

#pragma mark -From YYCategories
/**
 Create a snapshot image of the complete view hierarchy.
 */
- (nullable UIImage *)sq_snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)sq_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

/**
 Create a snapshot PDF of the complete view hierarchy.
 */
- (nullable NSData *)sq_snapshotPDF;

/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)sq_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)sq_removeAllSubviews;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *sq_viewController;

/**
 Returns the visible alpha on screen, taking into account superview and window.
 */
@property (nonatomic, readonly) CGFloat sq_visibleAlpha;

/**
 Converts a point from the receiver's coordinate system to that of the specified view or window.
 
 @param point A point specified in the local coordinate system (bounds) of the receiver.
 @param view  The view or window into whose coordinate system point is to be converted.
 If view is nil, this method instead converts to window base coordinates.
 @return The point converted to the coordinate system of view.
 */
- (CGPoint)sq_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

/**
 Converts a point from the coordinate system of a given view or window to that of the receiver.
 
 @param point A point specified in the local coordinate system (bounds) of view.
 @param view  The view or window with point in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The point converted to the local coordinate system (bounds) of the receiver.
 */
- (CGPoint)sq_convertPoint:(CGPoint)point fromViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)sq_convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)sq_convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;


@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

#pragma mark -From SQ
///=============================================================================
/// @name Hash
///=============================================================================

@property (nonatomic, strong) NSNumber *isNeedSpecialCorners;
@property (nonatomic, strong) NSNumber *rectCorner;

- (void)sq_defaultShadow;
- (void)sq_defaultShadowWithCornerRadius:(CGFloat)cornerRadius;
- (void)sq_defaultShadowWithDirection:(SQShadowDirection)direction;

/**
 只画下阴影
 */
- (void)sq_shadowBottomOnly;

/// 这个要通过子类调用
- (void)sq_roundingCorners_i:(UIRectCorner)corners;

/**
 * @brief 判断View是否显示在屏幕上
 */
- (BOOL)sq_isDisplayedInScreen;

+ (instancetype)loadNib;

/**
 *  从Xib 中快速创建
 */
+ (id)sq_loadViewFromNib;

/**
 添加阴影到view底部
 
 @param view vview
 @param shadowOpacity shadowOpacity
 @param shadowRadius shadowRadius
 @param cornerRadius cornerRadius
 @return CALayer
 */
+ (CALayer *)addShadowLayerBelowView:(UIView *)view
                         withOpacity:(float)shadowOpacity
                        shadowRadius:(CGFloat)shadowRadius
                     andCornerRadius:(CGFloat)cornerRadius;
@end

NS_ASSUME_NONNULL_END
