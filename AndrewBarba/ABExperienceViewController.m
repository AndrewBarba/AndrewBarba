//
//  ABExperienceViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABExperienceViewController.h"

@interface ABExperienceViewController ()
@property (nonatomic, weak) IBOutlet UIScrollView *carouselScrollView;
@end

@implementation ABExperienceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Experience";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[ABTrackingService sharedInstance] trackEvent:@"Experience Viewed" withValue:nil fromSender:@"Root"];
    self.carouselScrollView.contentSize = CGSizeMake(320*5, self.carouselScrollView.frame.size.height);
}

@end
