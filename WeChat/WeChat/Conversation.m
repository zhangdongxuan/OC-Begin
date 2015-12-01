//
//  Conversation.m
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "Conversation.h"

@implementation Conversation

-(Conversation *)initWithFrom:(NSString*)from  withMessage:(NSString*)message withAvatar:(NSString*)avatar
{
    if (self=[super init]) {
        self.from=from;
        self.message=message;
        self.avatarURL=avatar;
        self.date=[NSDate date];
    }
    
    return self;
}


-(NSString*) description{
    return [NSString stringWithFormat:@"from is%@  message is%@  avatarURL is%@ ",_from,_message,_avatarURL];
}

@end
