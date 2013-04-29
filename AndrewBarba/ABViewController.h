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
 *  Track Event
 */
- (void)_trackEvent:(NSString *)event from:(NSString *)sender withValue:(NSNumber *)value;

@end
