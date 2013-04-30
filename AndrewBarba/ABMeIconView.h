//
//  ABMeIconView.h
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABMeIconView;

@protocol ABMeIconViewDelegate <NSObject>
- (void)meIconView:(ABMeIconView *)meIconView tappedButton:(UIButton *)sender;
@end

@interface ABMeIconView : UIView
@property (nonatomic, weak) id <ABMeIconViewDelegate> delegate;
@end
