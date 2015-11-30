//
//  MainViewController.m
//  HelloWorld
//
//  Created by zdx on 15/11/25.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"Hello World!");
    
    //    UILabel *userNameLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, 100, 40)];
    //    userNameLable.text=@"UserName:";
    //    userNameLable.textAlignment=NSTextAlignmentLeft;
    //    [self.view addSubview:userNameLable];
    
    UITextField *userNameField=[[UITextField alloc]initWithFrame:CGRectMake(0, 80, 320, 40)];
    userNameField.tag=100;
    userNameField.borderStyle=UITextBorderStyleRoundedRect;
    userNameField.placeholder=@"用户名";
    userNameField.delegate=self;
    [self.view addSubview:userNameField];
    
    //    UILabel *passwordLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 90, 100, 40)];
    //    passwordLable.text=@"PassWord:";
    //    passwordLable.textAlignment=NSTextAlignmentLeft;
    //    [self.view addSubview:passwordLable];
    
    UITextField *passwordField=[[UITextField alloc]initWithFrame:CGRectMake(0, 130, 320, 40)];
    passwordField.tag=101;
    passwordField.borderStyle=UITextBorderStyleRoundedRect;
    passwordField.placeholder=@"密码";
    passwordField.delegate=self;
    passwordField.secureTextEntry=YES;
    [self.view addSubview:passwordField];
    
    UIButton *loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame=CGRectMake(90, 180, 120, 40);
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont systemFontOfSize:17.0];
    loginButton.titleLabel.textColor=[UIColor blackColor];
    loginButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    [loginButton setBackgroundColor:[UIColor blueColor]];
    
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [loginButton.layer setBorderWidth:1.0]; //边框宽度
    //    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    //    [loginButton.layer setBorderColor:colorref];//边框颜色
    
    [loginButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [loginButton addTarget:self action:@selector(doLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)doLogin:(UIButton *)button{
     [button setBackgroundColor:[UIColor blueColor]];
    UITextField *userNameField=(UITextField *)[self.view viewWithTag:100];
    NSString *userName=userNameField.text;
    
    UITextField *passwordField=(UITextField *)[self.view viewWithTag:101];
    NSString *passWord=passwordField.text;
    
    NSLog(@"UserName is %@\nPassWord is %@",userName,passWord);
}

-(void)touchDown:(UIButton *) button{
    [button setBackgroundColor:[UIColor grayColor]];
}

@end
