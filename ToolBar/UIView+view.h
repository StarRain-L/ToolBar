//
//  UIView+view.h
//  WeiBo_15
//
//  Created by sifang on 15-1-6.
//  Copyright (c) 2015年 sifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (view)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/* frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat maxX;

/* frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat maxY;

@end
