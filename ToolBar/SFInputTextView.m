//
//  SFInputTextView.m
//  WeiBo07
//
//  Created by AAA on 15/8/11.
//  Copyright (c) 2015年 easywed. All rights reserved.
//

#import "SFInputTextView.h"
#import "UIView+view.h"
#define kMaxLength   200      //输入的最多数
//颜色
#define EWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface SFInputTextView()

@end;
@implementation SFInputTextView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //1.创建用于显示提醒文本的lable
        UILabel *placeholderLable = [[UILabel alloc]init];
        placeholderLable.numberOfLines = 0;
        placeholderLable.text = @"正文 (不少于10字)    ";
//        placeholderLable.width = screenWidth-20;
//        placeholderLable.height = 20;
        [self.placeholderLable sizeToFit];
        placeholderLable.x = 10;
        placeholderLable.y = 8;
        placeholderLable.textColor = EWColor(153, 153, 153);
        //设置字体大小
        self.font = [UIFont systemFontOfSize:14];
        placeholderLable.font = self.font;
        [self addSubview:placeholderLable];
        self.placeholderLable = placeholderLable;
        //2.监听文本框输入事件
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    return self;
}
-(void)textChange{
  //判断是否输入了内容,如果有内容就隐藏label,没有就显示label
    self.placeholderLable.hidden = (self.text.length>0);
    NSLog(@"--%d",self.text.length);
    NSString *des = [NSString stringWithFormat:@"最多只能输入%d个字哦",kMaxLength];
    NSString *toBeString = self.text;
    UITextInputMode *currentInputMode = self.textInputMode;
    NSString *lang = [currentInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > kMaxLength) {
//                 [MBProgressHUD showError:des toView:self];
                self.text = [toBeString substringToIndex:kMaxLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > kMaxLength) {
//             [MBProgressHUD showError:des toView:self];
            self.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)setFont:(UIFont *)font{
    [super setFont:font];
     self.placeholderLable.font = font;
    [self.placeholderLable sizeToFit];
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = [placeholder copy];
    self.placeholderLable.text = _placeholder;
    [self.placeholderLable sizeToFit];
}
@end
