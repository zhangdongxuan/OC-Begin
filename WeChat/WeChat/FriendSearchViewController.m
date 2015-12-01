//
//  FriendSearchViewController.m
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "FriendSearchViewController.h"
#import "FriendCell.h"
#import "User.h"
@interface FriendSearchViewController ()
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation FriendSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"FriendCell"];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
     _data = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.tableView.originY = HEIGHT_NAVBAR + HEIGHT_STATUSBAR;
//    self.tableView.frameHeight = HEIGHT_SCREEN - self.tableView.originY;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"联系人";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    
//    User *user = [_data objectAtIndex:indexPath.row];
//    [cell setUser:user];
//    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
//    indexPath.row == _data.count - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return nil;
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    NSString *searchText = searchController.searchBar.text;
//    [_data removeAllObjects];
//    for (TLUser *user in _friendsArray) {
//        if ([user.userID containsString:searchText] || [user.username containsString:searchText] || [user.nikename containsString:searchText] || [user.pinyin containsString:searchText] || [user.initial containsString:searchText]) {
//            [_data addObject:user];
//        }
//    }
    [self.tableView reloadData];
}


@end
