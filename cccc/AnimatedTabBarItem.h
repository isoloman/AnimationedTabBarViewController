//
//  AnimatedTabBarItem.h
//  TabBarAnimation
//
//  Created by liusilan on 15/2/3.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarAnimationProtocol.h"
#import "AnimationFactory.h"

@class TabBarItemAnimation;

@interface AnimatedTabBarItem : UITabBarItem<TabBarAnimationProtocol>
@property (nonatomic, strong)  TabBarItemAnimation *animation;

@end
