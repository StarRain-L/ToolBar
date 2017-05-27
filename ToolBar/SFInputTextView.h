//
//  SFInputTextView.h
//  WeiBo07
//
//  Created by AAA on 15/8/11.
//  Copyright (c) 2015年 easywed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFInputTextView : UITextView
/**
 *  设置提醒文字
 */
@property (nonatomic, copy)NSString *placeholder;
@property (nonatomic, strong)UILabel *placeholderLable;

@end
