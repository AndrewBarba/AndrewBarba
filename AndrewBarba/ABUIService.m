//
//  ABUIService.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABUIService.h"

@implementation ABUIService

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)_initPrivate;
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)viewControllerWithStoryboardIdentifier:(NSString *)identifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}


/**
 * Return the shared instance, create one if it doesn't exist.
 */
+(ABUIService *)sharedInstance
{
    static ABUIService *instance = nil;
    if (!instance) {
        instance = [[ABUIService alloc] _initPrivate];
    }
    return instance;
}

@end
