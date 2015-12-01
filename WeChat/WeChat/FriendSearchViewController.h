//
//  FriendSearchViewController.h
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "CommonTableViewController.h"

@interface FriendSearchViewController : CommonTableViewController<UISearchResultsUpdating>

@property (nonatomic, copy) NSMutableArray *friendsArray;

@end
