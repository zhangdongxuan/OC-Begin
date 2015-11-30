//
//  User.h
//  WeChat
//
//  Created by zdx on 15/11/27.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nikename;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, strong) NSString *initial;

@end
