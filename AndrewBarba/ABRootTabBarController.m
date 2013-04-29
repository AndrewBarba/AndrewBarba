//
//  ABRootTabBarController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABRootTabBarController.h"

@interface ABRootTabBarController ()

@end

@implementation ABRootTabBarController

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
	[self _presentLoadingScreen];
}

- (void)_presentLoadingScreen
{
    UIViewController *loading = [[ABUIService sharedInstance] viewControllerWithStoryboardIdentifier:@"Loading View Controller"];
    [self presentViewController:loading animated:NO completion:nil];
}

@end
