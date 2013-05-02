//
//  ABTrackingService.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABTrackingService.h"
#import "GAI.h"

@interface ABTrackingService()
@property (nonatomic, strong) id <GAITracker> gaiTracker;
@end

@implementation ABTrackingService

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)_initPrivate
{
    self = [super init];
    if (self) {
        [GAI sharedInstance].trackUncaughtExceptions = YES;
        [GAI sharedInstance].dispatchInterval = 10;
        self.gaiTracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-40503557-1"];
    }
    return self;
}

- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value fromSender:(NSString *)sender
{
    [self.gaiTracker sendEventWithCategory:@"AndrewBarba" withAction:event withLabel:sender withValue:value];
}

+ (ABTrackingService *)sharedInstance
{
    static ABTrackingService *instance = nil;
    if (!instance) {
        instance = [[ABTrackingService alloc] _initPrivate];
    }
    return instance;
}

@end
