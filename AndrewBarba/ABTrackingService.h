//
//  ABTrackingService.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABTrackingService : NSObject

+ (ABTrackingService *)sharedInstance;

- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value fromSender:(NSString *)sender;

@end
