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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setSelectedIndex:1];
    
    UITabBarItem *education = self.tabBar.items[0];
    [education setFinishedSelectedImage:[UIImage imageNamed:@"book_sel"] withFinishedUnselectedImage:[UIImage imageNamed:@"book"]];
    
    UITabBarItem *experience = self.tabBar.items[1];
    [experience setFinishedSelectedImage:[UIImage imageNamed:@"globe_sel"] withFinishedUnselectedImage:[UIImage imageNamed:@"globe"]];
    
    UITabBarItem *projects = self.tabBar.items[2];
    [projects setFinishedSelectedImage:[UIImage imageNamed:@"gear_sel"] withFinishedUnselectedImage:[UIImage imageNamed:@"gear"]];
}

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
