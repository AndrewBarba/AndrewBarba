//
//  UIViewController+AB.m
//  AndrewBarba
//
//  Created by Andrew Barba on 5/1/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "UIViewController+AB.h"

@implementation UIViewController (AB)

- (void)popAndScroll
{
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)self;
        if (nav.viewControllers.count > 1) {
            [nav popToRootViewControllerAnimated:YES];
        } else if (nav.viewControllers.count == 1) {
            UIViewController *rootVC = nav.viewControllers[0];
            [rootVC popAndScroll];
        }
        return;
    }
    
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *s = (UIScrollView *)self.view;
        if (s.scrollsToTop && s.scrollEnabled) {
            [s setContentOffset:CGPointZero animated:YES];
        }
        return; 
    }
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *s = (UIScrollView *)view;
            if (s.scrollsToTop && s.scrollEnabled) {
                [s setContentOffset:CGPointZero animated:YES];
            }
        }
    }
}

@end
