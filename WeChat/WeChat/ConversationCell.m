//
//  ConversationCell.m
//  WeChat
//
//  Created by zdx on 15/11/30.
//  Copyright © 2015年 zdx. All rights reserved.
//

#import "ConversationCell.h"

@interface ConversationCell ()

@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *messageLabel;

@end
@implementation ConversationCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.avatarImageView];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.messageLabel];
//        [self setBackgroundColor:[UIColor blueColor]];
    }
    return self;
}


-(void)layoutSubviews{
    self.leftFreeSpace=self.frameHeight*0.14;
    [super layoutSubviews];
    float imageWidth=self.frameHeight*0.72;
    float space=self.leftFreeSpace;
    [_avatarImageView setFrame:CGRectMake(space, space, imageWidth, imageWidth)];
    
    float labelX=space*2+imageWidth;
    float labelY=self.frameHeight*0.135;
    float labelHeight=self.frameHeight*0.4;
//    NSLog(@"labelHeight %f",labelHeight);
    float labelWidth=self.frameWidth-labelX-space*1.5;
    
    float dateWidth=70;
    float dateHight=labelHeight*0.75;
    float dateX=self.frameWidth-space*1.5-dateWidth;
    [_dateLabel setFrame:CGRectMake(dateX, labelY*0.75, dateWidth, dateHight)];
    
    float usernameLabelWidth = self.frameWidth - labelX - dateWidth - space * 2;
    [_userNameLabel setFrame:CGRectMake(labelX, labelY, usernameLabelWidth, labelHeight)];
    
//    NSLog(@"labelY :%f",labelY);
    
    
    labelY = self.frameHeight * 0.91 - labelHeight;
    [_messageLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    
    NSLog(@"888888888");
    
}

- (void) setConversation:(Conversation *)conversation
{
    _conversation = conversation;
    
    NSLog(@"conversation is %@",conversation);
    NSLog(@"%@",_userNameLabel);
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", _conversation.avatarURL]]];
    [_userNameLabel setText:_conversation.from];
//    if ([@"Alice" isEqualToString: conversation.from ]) {
//        [_userNameLabel setBackgroundColor:[UIColor redColor]];
//    }
    
    [_dateLabel setText:@"11:01"];
    [_messageLabel setText:_conversation.message];
}

- (UIImageView *) avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
    }
    return _avatarImageView;
}

- (UILabel *) userNameLabel
{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc] init];
        [_userNameLabel setFont:[UIFont systemFontOfSize:16]];
    }
    NSLog(@"IIII");
    
    return _userNameLabel;
}

- (UILabel *) dateLabel
{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        [_dateLabel setAlpha:0.8];
        [_dateLabel setFont:[UIFont systemFontOfSize:12]];
        [_dateLabel setTextAlignment:NSTextAlignmentRight];
        [_dateLabel setTextColor:[UIColor grayColor]];
    }
    return _dateLabel;
}

- (UILabel *) messageLabel
{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        [_messageLabel setTextColor:[UIColor grayColor]];
        [_messageLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _messageLabel;
}

@end
