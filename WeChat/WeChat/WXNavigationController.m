//
//  TLNavigationController.m
//  WeChat
//
//  Created by zdx on 15/11/27.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "WXNavigationController.h"

@implementation WXNavigationController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:DEFAULT_NAVBAR_COLOR];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
