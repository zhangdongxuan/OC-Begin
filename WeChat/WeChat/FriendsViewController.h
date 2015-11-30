//
//  FriendsViewController.h
//  WeChat
//
//  Created by zdx on 15/11/27.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "CommonTableViewController.h"

@interface FriendsViewController : CommonTableViewController

@property   (nonatomic,strong) NSMutableArray *friendsArray; //好友列表数据
@property   (nonatomic,strong) NSMutableArray *data;        //格式化的好友列表数据
@property   (nonatomic,strong) NSMutableArray *section;     //拼音首字母列表

@end
