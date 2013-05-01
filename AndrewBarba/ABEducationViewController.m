//
//  ABEducationViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABEducationViewController.h"
#import "ABEducationInfoCell.h"
#import "ABEducationVideoCell.h"

static NSString *const InfoCellIdentifier = @"Education Info Cell";
static NSString *const VideoCellIdentifier = @"Education Video Cell";
static NSString *const CourseCellIdentifier = @"Education Course Cell";

@interface ABEducationViewController () <UITableViewDataSource, UITableViewDelegate>

// Model
@property (nonatomic, strong) NSDictionary *northeastern;

// UI
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ABEducationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Education";
    self.northeastern = [[ABDataService sharedInstance] dataForKey:@"education"][0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
}

#pragma mark - Table View Data and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 2;
    NSArray *courses = self.northeastern[@"courses"];
    return courses.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) return nil;
    return @"Courses";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) return 80;
        if (indexPath.row == 1) return 181;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        ABEducationInfoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:InfoCellIdentifier forIndexPath:indexPath];
        [cell setUniversity:self.northeastern];
        return cell;
    }
    
    if (indexPath.row == 1 && indexPath.section == 0) {
        ABEducationVideoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:VideoCellIdentifier forIndexPath:indexPath];
        NSURL *url = [NSURL URLWithString:self.northeastern[@"media_url"]];
        [cell setVideoURL:url];
        return cell;
    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CourseCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.northeastern[@"courses"] objectAtIndex:indexPath.row][@"name"];
    cell.detailTextLabel.text = [self.northeastern[@"courses"] objectAtIndex:indexPath.row][@"professor"];
    return cell;
}

@end
