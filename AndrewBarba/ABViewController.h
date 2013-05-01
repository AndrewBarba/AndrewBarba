//
//  ABViewController.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "GAITrackedViewController.h"

@interface ABViewController : GAITrackedViewController

/**
 *  Track Event from this controller
 */
- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value;

/**
 *  Toggle Swipe Navigation. Enabled by default
 */
- (void)disableSwipeNavigation;
- (void)enableSwipeNavigation;

@end
