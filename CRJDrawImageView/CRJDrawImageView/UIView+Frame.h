//
//  UIView+Frame.h
//  黑马彩票
//
//  Created by yz on 14/11/6.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat yj_x;
@property (nonatomic, assign) CGFloat yj_y;
@property (nonatomic, assign) CGFloat yj_width;
@property (nonatomic, assign) CGFloat yj_height;

@property (nonatomic, assign) CGFloat yj_right;
@property (nonatomic, assign) CGFloat yj_bottom;

@property (nonatomic, assign) CGFloat yj_centerX;
@property (nonatomic, assign) CGFloat yj_centerY;

@property (nonatomic, assign) CGPoint yj_origin;
@property (nonatomic, assign) CGSize  yj_size;

//找到自己的vc
- (UIViewController *)yj_viewController;



@end
