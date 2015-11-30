//
//  RootViewController.m
//  WeChat
//
//  Created by zdx on 15/11/27.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "RootViewController.h"
#import "FriendsViewController.h"
#import "ConversationViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "WXNavigationController.h"

@interface RootViewController ()

@property (nonatomic, strong) FriendsViewController *friendsVC;
@property (nonatomic, strong) ConversationViewController *conversationVC;
@property (nonatomic, strong) DiscoverViewController *discoverVC;
@property (nonatomic, strong) MineViewController *mineVC;


@end
@implementation RootViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    
    //addSubView
    WXNavigationController *conversationVC=[[WXNavigationController alloc]initWithRootViewController:self.conversationVC];
    WXNavigationController *friendVC=[[WXNavigationController alloc]initWithRootViewController:self.friendsVC];
    WXNavigationController *discoverVC=[[WXNavigationController alloc]initWithRootViewController:self.discoverVC];
    WXNavigationController *mineVC=[[WXNavigationController alloc]initWithRootViewController:self.mineVC];
    
    [self setViewControllers:@[conversationVC,friendVC,discoverVC,mineVC]];
}

-(ConversationViewController *) conversationVC{
    if (_conversationVC==nil) {
        _conversationVC=[[ConversationViewController alloc]init];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

/**
 *  通讯录
 */
- (FriendsViewController *) friendsVC
{
    if (_friendsVC == nil) {
        _friendsVC = [[FriendsViewController alloc] init];
        [_friendsVC.tabBarItem setTitle:@"通讯录"];
        [_friendsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_friendsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _friendsVC;
}

/**
 *  发现
 */
- (DiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[DiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"发现"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

/**
 *  我
 */
- (MineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[MineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}


@end
