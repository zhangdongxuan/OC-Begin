//
//  LaunchViewController.m
//  HelloWorld
//
//  Created by zdx on 15/11/26.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "LaunchViewController.h"
#import "GuideViewController.h"



@implementation LaunchViewController


-(void)viewDidLoad{
    
    int screenWidth= [[UIScreen mainScreen] bounds].size.width;
    int screenHeight=[[UIScreen mainScreen] bounds].size.height;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight+50)];
    [imageView setImage:[UIImage imageNamed:@"Default.png"]];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    [self performSelector:@selector(goToPage:) withObject:@"hello" afterDelay:1.0f];
     NSLog(@"do finish");

}

-(void)goToPage:(NSString *)HELLO{
    NSLog(@"goToPage");
    GuideViewController *guideView=[[GuideViewController alloc]init];
    [self presentViewController:guideView animated:NO completion:^() {
        NSLog(@"新页面已加载");
    }];

}

-(void)completion{
    NSLog(@"finish");
}
@end
