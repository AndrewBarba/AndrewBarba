//
//  UIView+AB.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AB)

/**
 * Load view automatically from XIBs
 */
+ (id)loadFromXIB;
+ (id)loadFromXIB:(NSString *)nibName;
+ (id)loadFromXIB:(NSString *)nibName atIndex:(NSUInteger)index;

@end
