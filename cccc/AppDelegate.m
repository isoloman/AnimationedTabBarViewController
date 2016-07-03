//
//  AppDelegate.m
//  cccc
//
//  Created by GloryYin on 16/7/3.
//  Copyright © 2016年 GloryYin. All rights reserved.
//

#import "AppDelegate.h"
#import "AnimatedTabBarItem.h"
#import "AnimationType.h"
#import "AnimatedTabBarController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIViewController *firstViewController = [[UIViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    UIViewController *fourthViewController = [[ViewController alloc] init];
    UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    
    AnimatedTabBarItem * first = [AnimatedTabBarItem new];
    first.animation = [BounceAnimation new];
    [first setImage:[UIImage imageNamed:@"home_normal"]];
    [firstViewController setValue:first forKey:@"tabBarItem"];
    first.badgeValue = @".";
    
    
    AnimatedTabBarItem * second = [AnimatedTabBarItem new];
    second.animation = [BounceAnimation new];
    [second setImage:[UIImage imageNamed:@"mycity_normal"]];
    [secondViewController setValue:second forKey:@"tabBarItem"];
    
    
    AnimatedTabBarItem * third = [AnimatedTabBarItem new];
    third.animation = [BounceAnimation new];
    [third setImage:[UIImage imageNamed:@"message_normal"]];
    [thirdViewController setValue:third forKey:@"tabBarItem"];
    
    
    AnimatedTabBarItem * four = [AnimatedTabBarItem new];
    four.animation = [RotationAnimation new];
    [four setImage:[UIImage imageNamed:@"account_normal"]];
    [fourthViewController  setValue:four forKey:@"tabBarItem"];
    
    
    AnimatedTabBarController * tabbar = [AnimatedTabBarController new];
    tabbar.viewControllers = @[firstViewController,secondViewController,thirdViewController,fourthViewController];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [tabbar setMyTabBar];
        
    self.window.rootViewController = tabbar;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
