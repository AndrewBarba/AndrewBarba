//
//  ABRootViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABRootViewController.h"
#import "ABMeIconView.h"

@interface ABRootViewController () <UIGestureRecognizerDelegate, ABMeIconViewDelegate> {
    CGPoint _lastOrigin;
    CGPoint _topLeftOrigin;
    CGPoint _topRightOrigin;
    CGPoint _bottomLeftOrigin;
    CGPoint _bottomRightOrigin;
    CGPoint _topCenterOrigin;
    BOOL _meIconViewIsSelected;
}
@property (nonatomic, weak) IBOutlet ABMeIconView *meIconView;
@property (nonatomic, weak) IBOutlet UIView *meView;
@end

@implementation ABRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self _setupMeIconView];
    self.meView.alpha = 0;
    self.meView.userInteractionEnabled = NO;
}

#pragma mark - Me Icon View

- (void)_setupMeIconView
{
    // Set delegate
    self.meIconView.delegate = self;
    
    // Setup origins
    CGFloat padding = 10;
    CGSize mSize = self.meIconView.frame.size;
    CGSize vSize = self.view.frame.size;
    _topLeftOrigin = CGPointMake(-padding, padding);
    _bottomLeftOrigin = CGPointMake(-10, vSize.height - mSize.height - padding);
    _topRightOrigin = CGPointMake(vSize.width - mSize.width + padding, padding);
    _bottomRightOrigin = CGPointMake(vSize.width - mSize.width + padding, vSize.height - mSize.height - padding);
    _topCenterOrigin = CGPointMake((vSize.width / 2)-(mSize.width / 2), padding/2);
    
    // Create pan gesture
    [self _setupGesture];
    
    // Set initial state
    CGRect frame = self.meIconView.frame;
    frame.origin = _topLeftOrigin;
    self.meIconView.frame = frame;
    _lastOrigin = _topLeftOrigin;
}

- (void)_setupGesture
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_handlePan:)];
    pan.delegate = self;
    [self.meIconView addGestureRecognizer:pan];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return !_meIconViewIsSelected;
}

- (void)_handlePan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        _lastOrigin = self.meIconView.frame.origin;
        [self trackEvent:@"Me Icon Pan - Began" withValue:nil];
    }
    
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint t = [pan translationInView:self.view];
        CGPoint c = CGPointMake(_lastOrigin.x + t.x, _lastOrigin.y + t.y);
        CGRect frame = self.meIconView.frame;
        frame.origin = c;
        self.meIconView.frame = frame;
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        CGPoint v = [pan velocityInView:self.view];
        CGPoint c;
        if (v.x >= 0 && v.y >= 0) c = _bottomRightOrigin;
        if (v.x >= 0 && v.y < 0) c = _topRightOrigin;
        if (v.x < 0 && v.y >= 0) c = _bottomLeftOrigin;
        if (v.x < 0 && v.y < 0) c = _topLeftOrigin;
        CGFloat s =  sqrtf((v.x*v.x)+(v.y*v.y));
        [self _animateMeIconViewToPoint:c withTime:s > 1500 ? 0.15 : 0.4];
        _lastOrigin = c;
        [self trackEvent:@"Me Icon Pan - Ended" withValue:nil];
    }
}

- (void)_animateMeIconViewToPoint:(CGPoint)p withTime:(CGFloat)time
{
    [UIView animateWithDuration:time
                     animations:^{
                         CGRect frame = self.meIconView.frame;
                         frame.origin = p;
                         self.meIconView.frame = frame;
                     }];
}

- (void)meIconView:(ABMeIconView *)meIconView tappedButton:(UIButton *)sender
{
    _meIconViewIsSelected = !_meIconViewIsSelected;
    CGPoint c = _meIconViewIsSelected ? _topCenterOrigin : _lastOrigin;
    [self _animateMeIconViewToPoint:c withTime:0.3];
    self.meView.userInteractionEnabled = _meIconViewIsSelected;
    [UIView animateWithDuration:0.3 animations:^{
        self.meView.alpha = _meIconViewIsSelected ? 1.0 : 0.0;
    }];
    [self trackEvent:@"Me View Opened" withValue:@(_meIconViewIsSelected)];
}

@end
