//
//  AnimationFactory.h
//  TabBarAnimation
//
//  Created by liusilan on 15/2/3.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationType.h"
#import "TabBarItemAnimation.h"
#import "FumeAnimation.h"
#import "FrameAnimation.h"
#import "BounceAnimation.h"
#import "RotationAnimation.h"
#import "TransitionAnimation.h"

@class TabBarItemAnimation;

@interface AnimationFactory : NSObject

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type;

@end
