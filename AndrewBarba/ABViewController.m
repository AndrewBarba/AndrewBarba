//
//  ABViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABViewController.h"
#import "ABAppDelegate.h"

@interface ABViewController ()

@end

@implementation ABViewController

- (void)_trackEvent:(NSString *)event from:(NSString *)sender withValue:(NSNumber *)value
{
    [[ABAppDelegate gaiTracker] sendEventWithCategory:@"AndrewBarba" withAction:event withLabel:sender withValue:value];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.trackedViewName = title;
}

@end
