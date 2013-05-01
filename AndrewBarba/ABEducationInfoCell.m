//
//  ABEducationInfoCell.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/30/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABEducationInfoCell.h"

@interface ABEducationInfoCell()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *majorLabel;
@property (nonatomic, weak) IBOutlet UILabel *yearLabel;
@end

@implementation ABEducationInfoCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    // Do nothing, no selection for this cell
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    // Do nothing, no highlight state
}

- (void)setUniversity:(NSDictionary *)school
{
    self.nameLabel.text = school[@"university"];
    self.locationLabel.text = school[@"location"];
    self.majorLabel.text = school[@"major"];
    self.yearLabel.text = school[@"grad_year"];
    self.imageView.image = [UIImage imageNamed:school[@"media_image"]];
}

@end
