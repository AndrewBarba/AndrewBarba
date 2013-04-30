//
//  ABExperienceViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABExperienceViewController.h"

@interface ABExperienceViewController ()
@property (nonatomic, strong) NSArray *experienceArray;
@end

@implementation ABExperienceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Experience";
    self.experienceArray = [[ABDataService sharedInstance] dataForKey:@"experience"];
}

@end
