//
//  ABDataService.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABDataService.h"

@interface ABDataService()
@property (nonatomic, strong) NSDictionary *data;
@end

@implementation ABDataService

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)_initPrivate
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"abarba" ofType:@"plist"];
        self.data = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return self;
}

- (id)dataForKey:(NSString *)key
{
    return [[self.data objectForKey:key] mutableCopy];
}

+ (ABDataService *)sharedInstance
{
    static ABDataService *instance = nil;
    if (!instance) {
        instance = [[ABDataService alloc] _initPrivate];
    }
    return instance;
}

@end
