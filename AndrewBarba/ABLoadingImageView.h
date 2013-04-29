//
//  ABLoadingImageView.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/28/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABLoadingImageView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

- (void)animateOffScreen:(ABBlock)block;

@end
