//
//  AnimatedTabBarController.h
//  cccc
//
//  Created by GloryYin on 16/7/3.
//  Copyright © 2016年 GloryYin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedTabBarController : UITabBarController
-(void)setMyTabBar;

/**
 *  小红点
 *
 *  @param index 位置
 */
-(void)showPointMarkIndex:(NSInteger)index;

/**
 *  影藏指定位置角标
 *
 *  @param index 位置
 */
-(void)hideMarkIndex:(NSInteger)index;


@end

@interface NSObject (AnimatedTabBarController)

/*!
 * If `self` is kind of `UIViewController`, this method will return the nearest ancestor in the view controller hierarchy that is a tab bar controller. If `self` is not kind of `UIViewController`, it will return the `rootViewController` of the `rootWindow` as long as you have set the `AnimatedTabBarController` as the  `rootViewController`. Otherwise return nil. (read-only)
 */
@property (nonatomic, readonly) AnimatedTabBarController *animatedTabBarController;

@end

