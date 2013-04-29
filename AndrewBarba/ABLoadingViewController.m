//
//  ABLoadingViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABLoadingViewController.h"
#import "ABLoadingImageView.h"

@interface ABLoadingViewController ()
@property (nonatomic, weak) IBOutlet UIView *pictureContainerView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@end

@implementation ABLoadingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Loading";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    ABDispatchAfter(0.5, ^{
//        [self animatePictures:^{
//            NSLog(@"Done!");
//        }];
//    });
}

- (void)animatePictures:(ABBlock)completion
{
    [self _animatePictureAtIndex:0 completion:completion];
}

- (void)_animatePictureAtIndex:(NSUInteger)index completion:(ABBlock)block
{
    NSUInteger count = self.pictureContainerView.subviews.count;
    if (index < count) {
        ABLoadingImageView *view = self.pictureContainerView.subviews[index];
        if (index == count - 1) {
            [view animateOffScreen:^{
                ABDispatchAfter(0.3, block);
            }];
        } else {
            [view animateOffScreen:nil];
            ABDispatchAfter(0.1,^{
                [self _animatePictureAtIndex:index+1 completion:block];
            });
        }
    }
}

@end
