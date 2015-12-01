//
//  Conversation.h
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conversation : NSObject

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int messageCount;
@property (nonatomic, strong) NSString *avatarURL;

-(Conversation *)initWithFrom:(NSString*)from  withMessage:(NSString*)message withAvatar:(NSString*)avatar;

- (NSString *)description;

@end
