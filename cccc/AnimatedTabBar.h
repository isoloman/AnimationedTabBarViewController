//
//  AnimatedTabBar.h
//  cccc
//
//  Created by GloryYin on 16/7/3.
//  Copyright © 2016年 GloryYin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedTabBar : UITabBar

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


- (NSArray *)sortedSubviews;
- (NSArray *)tabBarButtonFromTabBarSubviews:(NSArray *)tabBarSubviews;
@end
