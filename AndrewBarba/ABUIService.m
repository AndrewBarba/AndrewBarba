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
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleBlackOpaque];
        [self _setupTabBarAppearence];
        [self _setupNavBarAppearence];
    }
    return self;
}

- (void)_setupTabBarAppearence
{
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_sel"]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor colorWithWhite:0.7 alpha:1.0]}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor colorWithRed:0.403 green:0.725 blue:0.933 alpha:1.0]}
                                             forState:UIControlStateSelected];
}

- (void)_setupNavBarAppearence
{
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.937 green:0.937 blue:0.937 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                UITextAttributeTextColor:[UIColor colorWithWhite:0.2 alpha:1.0],
                          UITextAttributeTextShadowColor:[UIColor clearColor]
    
     }];
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
