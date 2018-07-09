//
//  ChatCell.m
//  Parse
//
//  Created by Alice Park on 7/9/18.
//  Copyright © 2018 Alice Park. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bubbleView.layer.cornerRadius = 16;
    self.bubbleView.clipsToBounds = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChatMessage:(PFObject *)chat {
    
    self.chat = _chat;
    self.chatField.text = chat[@"text"];
    
    PFUser *user = chat[@"user"];
    if (user != nil) {
        self.usernameField.text = user.username;
    } else {
        self.usernameField.text = @"🤖";
    }
}

@end
