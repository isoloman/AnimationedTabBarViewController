//
//  AnimatedTabBar.m
//  cccc
//
//  Created by GloryYin on 16/7/3.
//  Copyright © 2016年 GloryYin. All rights reserved.
//

#import "AnimatedTabBar.h"

#import "AnimatedTabBarItem.h"

#define ItemsWidth [UIScreen mainScreen].bounds.size.width/self.items.count

@implementation AnimatedTabBar
{
    NSDictionary *_containers;
    NSMutableDictionary * _markPointDict;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addMarkPointView];
}


-(void)addMarkPointView{
    
    
    NSArray * tabSubViews = [self tabBarButtonFromTabBarSubviews:[self sortedSubviews]];
        
        for (int i = 0 ; i < tabSubViews.count; i++) {
            NSString * key = [NSString stringWithFormat:@"MarkPointIndex%@",@(i)];
            [self avarilableMutableDictory];
            UIView * markPoint = [_markPointDict valueForKey:key];
            
            if (!markPoint) {
                
                UIView * image ;
                
                for (UIView * view  in [tabSubViews[i] subviews]) {
                    if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        image = view;
                    }
                }
                markPoint = [UIView new];
                markPoint.layer.cornerRadius = 3;
                markPoint.backgroundColor = [UIColor redColor];
                markPoint.translatesAutoresizingMaskIntoConstraints = NO;
                [tabSubViews[i] addSubview:markPoint];
                
                [tabSubViews[i] addConstraint:[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:markPoint attribute:1 multiplier:1 constant:0]];
                [tabSubViews[i] addConstraint:[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:markPoint attribute:NSLayoutAttributeTop multiplier:1 constant:-2]];
                [markPoint addConstraint:[NSLayoutConstraint constraintWithItem:markPoint attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:6]];
                [markPoint addConstraint:[NSLayoutConstraint constraintWithItem:markPoint attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:6]];
                
                markPoint.hidden = YES;
                
                [_markPointDict setValue:markPoint forKey:key];
            }
            
        }
        
            
}

-(void)showPointMarkIndex:(NSInteger)index{
    NSString * key = [NSString stringWithFormat:@"MarkPointIndex%@",@(index)];
    
    UIView * markPoint = [_markPointDict valueForKey:key];
    
    markPoint.hidden = NO;
}


-(void)hideMarkIndex:(NSInteger)index{
    NSString * key = [NSString stringWithFormat:@"MarkPointIndex%@",@(index)];
    
    UIView * markPoint = [_markPointDict valueForKey:key];
    
    markPoint.hidden = YES;
}


-(void)avarilableMutableDictory{
    if (!_markPointDict) {
        _markPointDict = [[NSMutableDictionary alloc]initWithCapacity:5];
    }
}

/*!
 *  Deal with some trickiness by Apple, You do not need to understand this method, somehow, it works.
 *  NOTE: If the `self.title of ViewController` and `the correct title of tabBarItemsAttributes` are different, Apple will delete the correct tabBarItem from subViews, and then trigger `-layoutSubviews`, therefore subViews will be in disorder. So we need to rearrange them.
 */
- (NSArray *)sortedSubviews {
    NSArray *sortedSubviews = [self.subviews sortedArrayUsingComparator:^NSComparisonResult(UIView * formerView, UIView * latterView) {
        CGFloat formerViewX = formerView.frame.origin.x;
        CGFloat latterViewX = latterView.frame.origin.x;
        return  (formerViewX > latterViewX) ? NSOrderedDescending : NSOrderedAscending;
    }];
    return sortedSubviews;
}


- (NSArray *)tabBarButtonFromTabBarSubviews:(NSArray *)tabBarSubviews {
    NSMutableArray *tabBarButtonMutableArray = [NSMutableArray arrayWithCapacity:5];
    [tabBarSubviews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonMutableArray addObject:obj];
        }
    }];
    
    return [tabBarButtonMutableArray copy];
}



@end
