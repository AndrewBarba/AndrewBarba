//
//  ABProjectCell.h
//  AndrewBarba
//
//  Created by Andrew Barba on 5/1/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABProjectCell;

@protocol ABProjectCellDelegate <NSObject>

- (void)projectCell:(ABProjectCell *)projectCell didTapButton:(UIButton *)button withProject:(NSDictionary *)project;

@end

@interface ABProjectCell : UITableViewCell

@property (nonatomic, weak) id <ABProjectCellDelegate> delegate;

- (void)setProject:(NSDictionary *)project;

@end
