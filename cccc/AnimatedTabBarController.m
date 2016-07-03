//
//  AnimatedTabBarController.h
//  cccc
//
//  Created by GloryYin on 16/7/3.
//  Copyright © 2016年 GloryYin. All rights reserved.
//

#import "AnimatedTabBarController.h"
#import "AnimatedTabBarItem.h"
#import "AnimatedTabBar.h"
#import <objc/runtime.h>

typedef enum
{
    ImageViewTag = 100,
    LabelTag,
}AnimatedTabBarControllerTag;

@interface AnimatedTabBarController ()<UITabBarControllerDelegate>
{
    NSDictionary * _containers;
    AnimatedTabBar * _tabBar;
    NSMutableDictionary * _markPointDict;
}
@end

@implementation AnimatedTabBarController

- (id)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


-(void)setMyTabBar{

    _tabBar = [[AnimatedTabBar alloc] init];
    _tabBar.delegate = self;
    [self setValue:_tabBar forKey:@"tabBar"];
    
}

-(void)tabBar:(AnimatedTabBar *)tabBar didSelectItem:(UITabBarItem *)item{

    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqual:item]) {
            
            if (self.selectedIndex != idx) {
                AnimatedTabBarItem * item = (AnimatedTabBarItem *)obj;
                
                self.selectedIndex = idx;
                
                NSArray * tabSubViews = [tabBar tabBarButtonFromTabBarSubviews:[tabBar sortedSubviews]];
                
                NSLog(@"%@",[tabSubViews[idx] subviews]);
                
                for (UIView * view  in [tabSubViews[idx] subviews]) {
                    if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        UIImageView * image = (UIImageView *)view;
                        [item playAnimation:image textLabel:nil];

                    }
                }
                
                
                * stop = YES;
            }
            
        }
    }];
    
    
}
/**
 *"<UITabBarSwappableImageView: 0x7fa2d97883a0; frame = (33 6; 24 24); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7fa2d9788580>> - (null)",
 *"<_UIBadgeView: 0x7fa2d9777390; frame = (52 2; 18 18); userInteractionEnabled = NO; layer = <CALayer: 0x7fa2d9774a60>>"
 */

-(void)showPointMarkIndex:(NSInteger)index{
    
    [_tabBar showPointMarkIndex:index];
}


-(void)hideMarkIndex:(NSInteger)index{
    [_tabBar hideMarkIndex:index];
}


-(void)avarilableMutableDictory{
    if (!_markPointDict) {
        _markPointDict = [[NSMutableDictionary alloc]initWithCapacity:5];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


@implementation NSObject (AnimatedTabBarController)

- (AnimatedTabBarController *)animatedTabBarController {
    AnimatedTabBarController *tabBarController = objc_getAssociatedObject(self, @selector(animatedTabBarController));
    if (tabBarController) {
        return tabBarController;
    }
    if ([self isKindOfClass:[UIViewController class]] && [(UIViewController *)self parentViewController]) {
        tabBarController = [[(UIViewController *)self parentViewController] animatedTabBarController];
        return tabBarController;
    }
    id<UIApplicationDelegate> delegate = ((id<UIApplicationDelegate>)[[UIApplication sharedApplication] delegate]);
    UIWindow *window = delegate.window;
    if ([window.rootViewController isKindOfClass:[AnimatedTabBarController class]]) {
        tabBarController = (AnimatedTabBarController *)window.rootViewController;
    }
    return tabBarController;
}

@end
