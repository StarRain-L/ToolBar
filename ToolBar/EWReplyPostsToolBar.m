//
//  EWReplyPostToolBar.m
//  EasyWedAPP
//
//  Created by AAA on 15/8/12.
//  Copyright (c) 2015年 easywed. All rights reserved.
//  回复楼主的toolbar

#import "EWReplyPostsToolBar.h"
#import "UIView+view.h"

//获取设备的物理信息
#define screenHeight    [UIScreen mainScreen].bounds.size.height
#define screenWidth    [UIScreen mainScreen].bounds.size.width
//cell比例
#define EWCellScaleFrame         (([UIScreen mainScreen].bounds.size.width>320.0)?1.07:1.0)        //屏幕比例
//颜色
#define EWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface EWReplyPostsToolBar()<UITextFieldDelegate,UITextViewDelegate>


@end;
@implementation EWReplyPostsToolBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 0.5)];
    line.backgroundColor = EWColor(220, 220, 220);
    [self addSubview:line];
    // 2. 创建输入框
    [self setuptextview];
    // 2. 创建发送按钮
    [self setupSendBtn:nil highImage:nil];
}

/**
 *  创建输入框
 */
-(void)setuptextview{
    _heightTV = 35;
    _replyPost = [[SFInputTextView alloc] init];
    _replyPost.frame = CGRectMake(15, (self.height-_heightTV)/2, screenWidth-55-15, _heightTV);
    _replyPost.layer.borderWidth = 0.5;
    _replyPost.layer.cornerRadius = 16.0;
    _replyPost.layer.masksToBounds = YES;
    _replyPost.layer.borderColor = EWColor(243, 239, 246).CGColor;
    _replyPost.backgroundColor = EWColor(243, 239, 246);
    _replyPost.delegate = self;
    _replyPost.placeholder = @"添加你的评论                               ";
    _replyPost.font = [UIFont systemFontOfSize:14.0f];
    _replyPost.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5);
    //    _replyPost.text = @"默认清空下TextView是不能滚动的, 但是可以通过设置某些属性让其默认就可以滚动默认清空下TextView是不能滚动的, 但是可以通过设置某些属性让其默认就可以滚动";
    [self addSubview:_replyPost];
    
}
/**
 * 创建一个点击发送按钮
 */
- (void)setupSendBtn:(NSString *)image highImage:(NSString *)highImage
{
    // 1.创建按钮
    _sendBtn = [[UIButton alloc] init];
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_sendBtn setBackgroundImage:[UIImage imageNamed:@"compose_send"] forState:UIControlStateNormal];
    [_sendBtn setBackgroundColor:EWColor(255, 130, 182)];
    [_sendBtn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
    // 5.将按钮添加到view中
    [self addSubview:_sendBtn];
}

- (void)sendClick:(UIButton *)btn
{
   
    if (self.sendBtnClick) {
        self.sendBtnClick();
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _replyPost.frame = CGRectMake(15, (self.height-_heightTV)/2, screenWidth-90-15, _heightTV);
    _sendBtn.height = 30;
    _sendBtn.width = 60;
    _sendBtn.layer.cornerRadius = 15;
    _sendBtn.y = (self.height-30)/2;
    _sendBtn.x = screenWidth-75;
    
}

-(void)textViewDidChange:(UITextView *)textView{
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize sizeFrame = [textView sizeThatFits:constraintSize];
    if (80>sizeFrame.height && sizeFrame.height>30) {
        textView.height =sizeFrame.height;
        self.y = self.y-(sizeFrame.height-_heightTV);
        self.height = sizeFrame.height+15;
        _heightTV = sizeFrame.height;
    }
}

@end
