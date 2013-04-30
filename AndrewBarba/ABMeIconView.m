//
//  ABMeIconView.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABMeIconView.h"

@interface ABMeIconView()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIButton *button;
@end

@implementation ABMeIconView

- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.imageView.clipsToBounds = YES;
    
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 3.0;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 2.0;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.imageView.layer.cornerRadius = self.layer.cornerRadius;
    
    [self.button addTarget:self action:@selector(_handleTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.button addTarget:self action:@selector(_handleTouchUp:) forControlEvents:UIControlEventTouchDragInside];
    [self.button addTarget:self action:@selector(_handleTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self.button addTarget:self action:@selector(_handleTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)_handleTouchDown:(id)sender
{
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 4.0;
}

- (void)_handleTouchUp:(id)sender
{
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 2.0;
}

- (void)_handleTouchUpInside:(id)sender
{
    [self _handleTouchUp:sender];
    [self.delegate meIconView:self tappedButton:self.button];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
