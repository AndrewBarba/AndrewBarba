//
//  AB.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "AB.h"

@implementation AB

void ABDispatchOnMain(void (^block)()) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void ABDispatchAfter(float seconds, void (^block)()) {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(),block);
}

void ABDispatchBackground(void (^block)()) {
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    dispatch_async(queue,block);
}

@end
