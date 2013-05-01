//
//  ABProjectCell.m
//  AndrewBarba
//
//  Created by Andrew Barba on 5/1/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABProjectCell.h"

@interface ABProjectCell()
@property (nonatomic, strong) NSDictionary *project;

@property (nonatomic, weak) IBOutlet UIView *mainView;
@property (nonatomic, weak) IBOutlet UIView *detailView;
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *downloadsLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIButton *appStoreButton;
@end

@implementation ABProjectCell

- (void)setProject:(NSDictionary *)project
{
    if (_project != project) {
        _project = project;
        self.nameLabel.text = project[@"name"];
        self.descriptionLabel.text = project[@"description"];
        self.downloadsLabel.text = [NSString stringWithFormat:@"%@ downloads",project[@"downloads"]];
        self.dateLabel.text = project[@"date"];
        self.iconImageView.image = [UIImage imageNamed:project[@"icon"]];
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.appStoreButton addTarget:self action:@selector(_handleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.clipsToBounds = YES;
    
    self.mainView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.mainView.layer.shadowOffset = CGSizeZero;
    self.mainView.layer.shadowOpacity = 0.3;
    self.mainView.layer.shadowRadius = 2.0;
    self.mainView.layer.shouldRasterize = YES;
    self.mainView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.mainView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.mainView.bounds].CGPath;
    
    self.detailView.layer.cornerRadius = 5;
    self.detailView.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    self.detailView.layer.borderWidth = 1.0;
    
    self.iconImageView.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    self.iconImageView.layer.borderWidth = 1.0;
}

- (void)_handleButtonTapped:(id)sender
{
    [self.delegate projectCell:self didTapButton:sender withProject:self.project];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    // Do nothing
}

- (void)setSelected:(BOOL)selected
{
    // Do nothing
}

- (void)setHighlighted:(BOOL)highlighted
{
    [self setHighlighted:highlighted animated:NO];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    UIColor *color = highlighted ? [UIColor colorWithWhite:0.95 alpha:1.0] : [UIColor whiteColor];
    self.mainView.backgroundColor = color;
}

@end
