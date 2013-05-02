//
//  AB.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AB : NSObject

typedef void (^ABBooleanBlock)(BOOL succeeded, NSError* error);
typedef void (^ABIntegerBlock)(int number, NSError* error);
typedef void (^ABArrayBlock)(NSArray* objects, NSError* error);
typedef void (^ABObjectBlock)(id object, NSError* error);
typedef void (^ABImageBlock)(UIImage* image, NSError* error);
typedef void (^ABRequestBlock)(NSData *data,NSURLResponse *response,NSError* error);
typedef void (^ABBlock)(void);

/**
 * Queues up the given block to be executed on the main thread.
 */
void ABDispatchOnMain(void (^block)());

/**
 * Queues up the given block to be executed on the CURRENT thread after at least n seconds.
 */
void ABDispatchAfter(float seconds, void (^block)());

/**
 * Queues up a calculation to run on a background thread.
 */
void ABDispatchBackground(void (^block)());

@end
