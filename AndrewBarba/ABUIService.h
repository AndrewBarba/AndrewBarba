//
//  ABUIService.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABUIService : NSObject

+ (ABUIService *)sharedInstance;

- (id)viewControllerWithStoryboardIdentifier:(NSString *)identifier;

@end
