//
//  EWReplyPostsToolBar.h
//  EasyWedAPP
//
//  Created by AAA on 16/4/6.
//  Copyright © 2016年 easywed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFInputTextView.h"
@interface EWReplyPostsToolBar : UIView


@property (nonatomic, strong)SFInputTextView *replyPost;
@property (nonatomic, strong)UIButton *sendBtn;                 //发送
@property (nonatomic, strong)void(^sendBtnClick)();             //评论
@property (nonatomic, assign)CGFloat heightTV;
@end
