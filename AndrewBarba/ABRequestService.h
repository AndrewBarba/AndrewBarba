//
//  ABRequestService.h
//  AndrewBarba
//
//  Created by Andrew Barba on 5/1/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABRequestService : NSObject

+ (ABRequestService *)sharedInstance;

- (void)asyncRequest:(NSURL *)url complete:(ABRequestBlock)block;
- (void)asyncJSONRequest:(NSURL *)url completion:(ABObjectBlock)block;
- (void)asyncImageRequest:(NSURL *)url completion:(ABImageBlock)block;

@end
