//
//  ABEducationViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABEducationViewController.h"

@interface ABEducationViewController ()
@property (nonatomic, strong) NSArray *educationArray;
@end

@implementation ABEducationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Education";
    self.educationArray = [[ABDataService sharedInstance] dataForKey:@"education"];
}

@end
