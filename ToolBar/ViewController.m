//
//  ViewController.m
//  ToolBar
//
//  Created by jr on 2017/5/27.
//  Copyright © 2017年 jr. All rights reserved.
//

#import "ViewController.h"
#import "EWReplyPostsToolBar.h"
#import "UIView+view.h"

//获取设备的物理信息
#define screenHeight    [UIScreen mainScreen].bounds.size.height
#define screenWidth    [UIScreen mainScreen].bounds.size.width
#define kDuration           0.3
#define ToolbarH            50                     //toolbar的高度
@interface ViewController ()
@property (nonatomic, strong)EWReplyPostsToolBar          *toolbar;                       //自定义
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 监听键盘的弹出和收起
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self setupToolbar];

}

//创建自定义工具条 EWReplyPostToolBar
- (void)setupToolbar{
    _toolbar = [[EWReplyPostsToolBar alloc] init];
    _toolbar.frame = CGRectMake(0, screenHeight - ToolbarH, screenWidth, ToolbarH);
    _toolbar.backgroundColor = [UIColor whiteColor];

    _toolbar.sendBtn.hidden = NO;

    __weak typeof(self) weakself = self;
    //发送
    _toolbar.sendBtnClick = ^(){
        
        NSLog(@"点击发送==%@",weakself.toolbar.replyPost.text);
        [weakself  toolBarRecover];
    };
    [self.view addSubview:_toolbar];
}
//点击空白toolbar恢复
-(void)toolBarRecover{
    self.toolbar.sendBtn.hidden = NO;
    self.toolbar.replyPost.hidden = NO;
    self.toolbar.replyPost.text = @"";
    _toolbar.replyPost.placeholderLable.hidden = NO;
    self.toolbar.transform = CGAffineTransformIdentity;
    if (self.toolbar.y != screenHeight-ToolbarH) {
        _toolbar.heightTV = 35;
        _toolbar.height = ToolbarH;
        _toolbar.y = screenHeight-ToolbarH;
    }
    [self.view endEditing:YES];
}
#pragma mark - 通知
//显示键盘
- (void)keyboardDidShow:(NSNotification *)note{
    // 1.取出键盘的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘高度
    CGFloat keyboardHeigth = keyboardFrame.size.height;
    //    _keyboardH = keyboardHeigth;
    // 获取动画时间
    NSTimeInterval time = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSInteger animationCurve = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    // 2.设置工具条的Y值向上移动键盘的高度
    [UIView animateWithDuration:time delay:0 options:animationCurve << 16 animations:^{
        self.toolbar.transform = CGAffineTransformMakeTranslation(0, -keyboardHeigth);
    } completion:nil];
}
//隐藏键盘
- (void)keyboardDidHide:(NSNotification *)note{
    // 获取动画时间
    NSTimeInterval time = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSInteger animationCurve = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    // 2.设置工具条的Y值向上移动键盘的高度
    [UIView animateWithDuration:time delay:0 options:animationCurve << 16 animations:^{
        //        self.toolbar.replyPosterBtn.hidden = NO;
        //        self.toolbar.sendBtn.hidden = YES;
        //        self.toolbar.replyPost.hidden = YES;
        self.toolbar.transform = CGAffineTransformIdentity;
    } completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
