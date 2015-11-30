//
//  GuideViewController.m
//  HelloWorld
//
//  Created by zdx on 15/11/26.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "GuideViewController.h"
#import "RegisterViewController.h"

@implementation GuideViewController{
    NSArray *backGroundPics;
    int frontPageIndex;
    UIPageControl *pageConteol;
    UIImageView *imageView;
}
- (instancetype)init{
    
    backGroundPics=[[NSArray alloc]initWithObjects:@"viewpager_one.jpg",@"viewpager_two.jpg",@"viewpager_three.jpg", nil];
    
    
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    frontPageIndex=0;
    
    self.view.backgroundColor=[UIColor blackColor];
    //    backgroundImageViews=[[NSMutableArray alloc]init];
    [self initGuide];
    
}


-(void)initGuide{
    
    NSArray *descriptsArray=[[NSArray alloc]initWithObjects:
                             [NSArray arrayWithObjects:@"3km生活圈",@"说说自己，宣布你的生活领地！",nil],
                             [NSArray arrayWithObjects:@"楼下的事",@"楼下的事，你不知道吗？",nil],
                             [NSArray arrayWithObjects:@"你是超人",@"怒点32个赞，双倍暴击鄙视！",nil],nil];
    
    int screenWidth= [[UIScreen mainScreen] bounds].size.width;
    int screenHeight=[[UIScreen mainScreen] bounds].size.height;
    int oneThrirdWidth=screenWidth/3;
    int threeFifthHeight=3*screenHeight/5;
    int fourSixthHeight=7*screenHeight/7;
    
    NSLog(@"screenWidth :%D",screenWidth);
    
    imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,screenWidth,screenHeight)];
    [imageView setImage:[UIImage imageNamed:[backGroundPics objectAtIndex:0]]];
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0 , screenWidth,threeFifthHeight+90)];
    [scrollView setContentSize:CGSizeMake(screenWidth*3, 0)];
    [scrollView setPagingEnabled:YES];
    scrollView.showsVerticalScrollIndicator = FALSE;
    scrollView.showsHorizontalScrollIndicator = FALSE;
    scrollView.delegate=self;
    
    for (int i=0; i<3; i++) {
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(screenWidth*i, threeFifthHeight+20, screenWidth, 40)];
        lable.text=[[descriptsArray objectAtIndex:i] objectAtIndex:0];
        //        [lable setBackgroundColor:[UIColor whiteColor]];
        lable.textColor=[UIColor whiteColor];
        lable.font= [UIFont fontWithName:@"Helvetica" size:20];
        lable.textAlignment=NSTextAlignmentCenter;
        [scrollView addSubview:lable];
        
        UILabel *lable2=[[UILabel alloc]initWithFrame:CGRectMake(screenWidth*i, threeFifthHeight+48, screenWidth, 30)];
        //        [lable2 setBackgroundColor:[UIColor whiteColor]];
        lable2.textColor=[UIColor whiteColor];
        lable2.text=[[descriptsArray objectAtIndex:i] objectAtIndex:1];
        lable2.font= [UIFont fontWithName:@"Helvetica" size:15];
        lable2.textAlignment=NSTextAlignmentCenter;
        [scrollView addSubview:lable2];
    }
    
    UIButton *registerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame=CGRectMake(10, threeFifthHeight+100, screenWidth-20, 30);
    [registerButton.layer setCornerRadius:3.0];
    [registerButton setBackgroundColor:[UIColor redColor]];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize: 15];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [registerButton addTarget:self action:@selector(clickRegisterDown:) forControlEvents:UIControlEventTouchDown];
    [registerButton addTarget:self action:@selector(clickRegisterUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerButton];
    
    UIButton *loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame=CGRectMake(10, threeFifthHeight+135, screenWidth-20, 30);
    [loginButton.layer setCornerRadius:3.0];
    [loginButton setBackgroundColor:[UIColor whiteColor]];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize: 15];
    [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //给按钮设置点击事件
    [loginButton addTarget:self action:@selector(clickLoginDown:) forControlEvents:UIControlEventTouchDown];
    [loginButton addTarget:self action:@selector(clickLoginUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    //    UIView
    
    [self.view addSubview:scrollView];
    
    
    //初始化 UIPageControl 和 _scrollView 显示在 同一个页面中
    pageConteol = [[UIPageControl alloc] initWithFrame:CGRectMake(140, threeFifthHeight+65, 50, 40)];
    pageConteol.numberOfPages = 3;//设置pageConteol 的page 和 _scrollView 上的图片一样多
    pageConteol.tag = 201;
    
    [self.view addSubview: pageConteol];
    
   
}


//    UIImageView *bgImgView = [backgroundImageViews objectAtIndex:index];
//
//    [self.view addSubview:bgImgView];
//    [self.view sendSubviewToBack:bgImgView];




- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    int index = floor((scrollView.contentOffset.x - pageWidth / 2)/pageWidth) + 1;
    if (frontPageIndex!=index) {
        [imageView setImage:[UIImage imageNamed:[backGroundPics objectAtIndex:index]]];
        frontPageIndex=index;
        pageConteol.currentPage=index;
    }
    
}

-(void)clickRegisterDown:(UIButton *)button{
    NSLog(@"adrbigve");
    [button setBackgroundColor:[UIColor colorWithRed:0.8 green:0.1 blue:0 alpha:0.8]];
    
}

-(void)clickRegisterUp:(UIButton *)button{
    [button setBackgroundColor:[UIColor redColor]];
    RegisterViewController *registerView=[[RegisterViewController alloc]init];
    [self presentViewController:registerView animated:YES completion:nil];
}

-(void)clickLoginDown:(UIButton *)button{
    NSLog(@"adrbigve");
    [button setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:0.8]];
    
}
-(void)clickLoginUp:(UIButton *)button{
    NSLog(@"adrbigve");
    [button setBackgroundColor:[UIColor whiteColor]];
    
}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int index = floor((scrollView.contentOffset.x - pageWidth / 2)/pageWidth) + 1;
//    NSLog(@"frontPageIndex %d",frontPageIndex);
//    NSLog(@"index %d",index);
//    if (frontPageIndex!=index) {
//        UIGraphicsBeginImageContext(self.view.frame.size);
//        [[backgroundImageViews objectAtIndex:index] drawInRect:self.view.bounds];
//        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
//        NSLog(@"Change The background Image  by 11111") ;
//
//    }
//    frontPageIndex=index;
//
//}
//
//- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int index = floor((scrollView.contentOffset.x - pageWidth / 2)/pageWidth) + 1;
//    NSLog(@"frontPageIndex %d",frontPageIndex);
//    NSLog(@"index %d",index);
//    if (frontPageIndex!=index) {
//        UIGraphicsBeginImageContext(self.view.frame.size);
//        [[backgroundImageViews objectAtIndex:index] drawInRect:self.view.bounds];
//        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
//        NSLog(@"DIFFERENT: index :%d     i:%d" ,index,frontPageIndex) ;
//
//    }
//    frontPageIndex=index;
//}

@end
