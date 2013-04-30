//
//  ABProjectsViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABProjectsViewController.h"

@interface ABProjectsViewController ()
@property (nonatomic, strong) NSArray *projectsArray;
@end

@implementation ABProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Projects";
    self.projectsArray = [[ABDataService sharedInstance] dataForKey:@"projetcs"];
}

@end
