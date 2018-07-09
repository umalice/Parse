//
//  ChatCell.h
//  Parse
//
//  Created by Alice Park on 7/9/18.
//  Copyright © 2018 Alice Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"

@interface ChatCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *chatField;
@property (weak, nonatomic) IBOutlet UILabel *usernameField;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (strong, nonatomic) PFObject *chat;

- (void)setChatMessage:(PFObject *)chat;

@end
