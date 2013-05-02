//
//  ABRequestService.m
//  AndrewBarba
//
//  Created by Andrew Barba on 5/1/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABRequestService.h"

@interface ABRequestService()

@end

@implementation ABRequestService

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)_initPrivate
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)asyncRequest:(NSURL *)url complete:(ABRequestBlock)block
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url
                                                                cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                                            timeoutInterval:20];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if (block) block(data,response,error);
    }];
}

- (void)asyncJSONRequest:(NSURL *)url completion:(ABObjectBlock)block
{
    [self asyncRequest:url complete:^(NSData *data, NSURLResponse *response, NSError *error){
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (json && !error) {
            if (block) block(json,nil);
        } else {
            if (block) block(nil,error);
        }
    }];
}

- (void)asyncImageRequest:(NSURL *)url completion:(ABImageBlock)block
{
    [self asyncRequest:url complete:^(NSData *data, NSURLResponse *response, NSError *error){
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (image && !error) {
            if (block) block(image,nil);
        } else {
            if (block) block(nil,error);
        }
    }];
}


+ (ABRequestService *)sharedInstance
{
    static ABRequestService *instance = nil;
    if (!instance) {
        instance = [[ABRequestService alloc] _initPrivate];
    }
    return instance;
}

@end
