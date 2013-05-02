//
//  ABProjectsViewController.m
//  AndrewBarba
//
//  Created by Andrew Barba on 4/29/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "ABProjectsViewController.h"
#import "ABProjectCell.h"

static NSString *const ProjectCellIdentifier = @"Project Cell";

@interface ABProjectsViewController () <UITableViewDataSource, UITableViewDelegate, ABProjectCellDelegate>

// Model
@property (nonatomic, strong) NSMutableArray *projects;

// UI
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ABProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Projects";
    self.projects = [[ABDataService sharedInstance] dataForKey:@"projects"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollsToTop = YES;
}

#pragma mark - Table View Data and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.projects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *project = self.projects[indexPath.row];
    if ([project[@"selected"] boolValue]) {
        return 200;
    } else {
        return 70;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *project = self.projects[indexPath.row];
    ABProjectCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ProjectCellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell setProject:project];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *project = [self.projects[indexPath.row] mutableCopy];
    BOOL selected = ![project[@"selected"] boolValue];
    project[@"selected"] = @(selected);
    self.projects[indexPath.row] = project;
    
    [self.tableView beginUpdates];
        /* update block to force cell animation */
    [self.tableView endUpdates];
    ABDispatchOnMain(^{
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    });
    [[ABTrackingService sharedInstance] trackEvent:@"Projects - Tapped Project Cell" withValue:nil fromSender:project[@"name"]];
}

- (void)projectCell:(ABProjectCell *)projectCell didTapButton:(UIButton *)button withProject:(NSDictionary *)project
{
    NSString *path = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",project[@"app_id"]];
    NSURL *url = [NSURL URLWithString:path];
    [[ABTrackingService sharedInstance] trackEvent:@"Projects - Viewed App" withValue:nil fromSender:path];
    [[UIApplication sharedApplication] openURL:url];
}

@end
