//
//  ConversationViewController.m
//  WeChat
//
//  Created by zdx on 15/11/27.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "User.h"
#import "Conversation.h"
#import "ChatViewController.h"
#import "ConversationCell.h"
#import "ConversationViewController.h"


@interface ConversationViewController (){
    NSMutableArray *contacts;
}

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ChatViewController *chatVC;


@end

@implementation ConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    self.tableView.delegate=self;
    [self initData];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
}

-(void)initData{
    contacts=[[NSMutableArray alloc]init];
    Conversation * c1=[[Conversation alloc]initWithFrom:@"Alice" withMessage:@"Hello" withAvatar:@"0.jpg"];
    Conversation * c2=[[Conversation alloc]initWithFrom:@"JJack" withMessage:@"I am code" withAvatar:@"1.jpg"];
    Conversation * c3=[[Conversation alloc]initWithFrom:@"Mactto" withMessage:@"Welcome!!" withAvatar:@"2.jpg"];
    Conversation * c4=[[Conversation alloc]initWithFrom:@"Disen" withMessage:@"bilbilbil" withAvatar:@"3.jpg"];
    Conversation * c5=[[Conversation alloc]initWithFrom:@"Lynatao" withMessage:@"inginging" withAvatar:@"4.jpg"];
    Conversation * c6=[[Conversation alloc]initWithFrom:@"Marttin" withMessage:@"world" withAvatar:@"5.jpg"];
    [contacts addObject:c1];
    [contacts addObject:c2];
    [contacts addObject:c3];
    [contacts addObject:c4];
    [contacts addObject:c5];
    [contacts addObject:c6];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//返回有多少个Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

//有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ConversationCell *cell = [[ConversationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Conversation *conversation=[contacts objectAtIndex:indexPath.row];
    [cell setConversation:conversation];
      [cell setTopLineStyle:CellLineStyleNone];
    
    if (indexPath.row == contacts.count - 1) {
        [cell setBottomLineStyle:CellLineStyleFill];
    }
    else {
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    
    return cell;
}


- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


/**
 *当用户点击列表时触发该方法
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    User *user=[[User alloc]init];
    
    Conversation *conversation=[contacts objectAtIndex:indexPath.row];
    user.username=[conversation from];
    user.avatarURL=[conversation avatarURL];
    
    if (_chatVC==nil) {
        _chatVC=[[ChatViewController alloc]init];
    }
    
    _chatVC.user=user;
    
    //页面跳转的方法
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_chatVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
