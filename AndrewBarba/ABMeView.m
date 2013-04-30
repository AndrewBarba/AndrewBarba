//
//  ABMeView.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABMeView.h"

@interface ABMeView()
@property (nonatomic, weak) IBOutlet UIView *contentView;
@end

@implementation ABMeView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.layer.cornerRadius = 4.0;
    self.contentView.layer.borderColor = [UIColor colorWithWhite:0.2 alpha:0.8].CGColor;
    self.contentView.layer.borderWidth = 1;
    self.clipsToBounds = YES;
}



@end
