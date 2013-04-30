//
//  ABDataService.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABDataService : NSObject

+ (ABDataService *)sharedInstance;

- (id)dataForKey:(NSString *)key;

@end
