//
//  UIView+view.m
//  WeiBo_15
//
//  Created by sifang on 15-1-6.
//  Copyright (c) 2015年 sifang. All rights reserved.
//

#import "UIView+view.h"

@implementation UIView (view)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setSize:(CGSize)size
{
    CGRect tempFrame = self.frame;
    tempFrame.size = size;
    self.frame = tempFrame;
}
- (CGSize)size
{
    return self.frame.size;
}
- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x - frame.size.width;
    self.frame = frame;
}

- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMaxY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y - frame.size.height;
    self.frame = frame;
}
//-(void)setFrame:(CGRect)frame{
//   
//}
@end
