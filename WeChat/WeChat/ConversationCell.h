//
//  ConversationCell.h
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "Conversation.h"

@interface ConversationCell : CommonTableViewCell

@property (nonatomic, strong) Conversation *conversation;

@end
