//
//  ABViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABViewController.h"
#import "ABAppDelegate.h"

@interface ABViewController () {
    BOOL _shouldUseSwipeNavigation;
}

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _handleSwipe];
}

#pragma mark - Tracking

- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value
{
    [[ABTrackingService sharedInstance] trackEvent:event withValue:value fromSender:self.trackedViewName];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.trackedViewName = title;
}

#pragma mark - Swipe Navigation

- (void)disableSwipeNavigation
{
    _shouldUseSwipeNavigation = NO;
}

- (void)enableSwipeNavigation
{
    _shouldUseSwipeNavigation = YES;
}

- (void)_setupSwipeNavigation
{
    _shouldUseSwipeNavigation = YES;
    SEL _swipeSelector = @selector(_handleSwipe);
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:_swipeSelector];
    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipe];
}

- (void)_handleSwipe
{
    if (_shouldUseSwipeNavigation) [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Scrolling

- (void)scrollToTop
{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            if (scrollView.scrollEnabled && scrollView.scrollsToTop) {
                [scrollView setContentOffset:CGPointZero animated:YES];
                return;
            }
        }
    }
}

@end
