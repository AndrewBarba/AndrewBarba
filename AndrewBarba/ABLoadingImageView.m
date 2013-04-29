//
//  ABLoadingImageView.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABLoadingImageView.h"

@implementation ABLoadingImageView

- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 3.0;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 2.0;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)animateOffScreen:(ABBlock)block
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         [self _growInPlace:20];
                     }
                     completion:^(BOOL done){
                         [UIView animateWithDuration:0.6
                                          animations:^{
                                              self.alpha = 0.0;
                                              [self _shrinkInPlace];
                                          }
                                          completion:^(BOOL done){
                                              if (block) block();
                                          }];
                     }];
}

- (void)_growInPlace:(CGFloat)size
{
    CGRect frame = self.frame;
    frame.size.width += size;
    frame.size.height += size;
    frame.origin.x -= (size/2);
    frame.origin.y -= (size/2);
    self.frame = frame;
}

- (void)_shrinkInPlace
{
    CGRect frame = self.frame;
    frame.origin.x += frame.size.width / 2;
    frame.origin.y += frame.size.height / 2;
    frame.size.width = 0;
    frame.size.height = 0;
    self.frame = frame;
}

@end
