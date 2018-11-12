//
//  UIView+Frame.m
//  黑马彩票
//
//  Created by yz on 14/11/6.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)yj_x
{
    return self.frame.origin.x;
}


- (void)setYj_x:(CGFloat)yj_x
{
    CGRect frame = self.frame;
    frame.origin.x = yj_x;
    self.frame = frame;
}

- (CGFloat)yj_y
{
    return self.frame.origin.y;
}

- (void)setYj_y:(CGFloat)yj_y
{
    CGRect frame = self.frame;
    frame.origin.y = yj_y;
    self.frame = frame;
}
- (CGFloat)yj_width
{
    return self.frame.size.width;
}

- (void)setYj_width:(CGFloat)yj_width
{
    CGRect frame = self.frame;
    frame.size.width = yj_width;
    self.frame = frame;

}

- (CGFloat)yj_height
{
    return self.frame.size.height;
}

- (void)setYj_height:(CGFloat)yj_height
{
    CGRect frame = self.frame;
    frame.size.height = yj_height;
    self.frame = frame;
}

- (CGFloat)yj_right
{
    return self.frame.origin.x+self.frame.size.width;
}

- (void)setYj_right:(CGFloat)yj_right{

    CGRect frame = self.frame;
    frame.origin.x = yj_right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)yj_bottom
{
    return self.frame.origin.y+self.frame.size.height;
}

- (void)setYj_bottom:(CGFloat)yj_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = yj_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yj_centerX{
    return self.center.x;
}

- (void)setYj_centerX:(CGFloat)yj_centerX{
    self.center = CGPointMake(yj_centerX, self.center.y);
}

- (CGFloat)yj_centerY{
    return self.center.y;
}

- (void)setYj_centerY:(CGFloat)yj_centerY{
    self.center = CGPointMake(self.center.x, yj_centerY);
}

- (CGPoint)yj_origin{
    return self.frame.origin;
}

- (void)setYj_origin:(CGPoint)yj_origin{
    CGRect frame = self.frame;
    frame.origin = yj_origin;
    self.frame = frame;
}

- (CGSize)yj_size{
    return self.frame.size;
}

- (void)setYj_size:(CGSize)yj_size{
    CGRect frame = self.frame;
    frame.size = yj_size;
    self.frame = frame;
}

- (UIViewController *)yj_viewController{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



@end
