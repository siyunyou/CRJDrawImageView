//
//  CRJDrawImageView.h
//  DrawNoteTest
//
//  Created by crj on 2018/7/11.
//  Copyright © 2018年 CRJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRJDrawImageView : UIImageView

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, copy) void (^drawBackListCountChange) (NSInteger count);
@property (nonatomic, copy) void (^drawForwardListCountChange) (NSInteger count);

//后退
- (void)backDraw;
//前进
- (void)forwardDraw;

//是否可以后退
- (BOOL)canBack;
//是否可以前进
- (BOOL)canForward;

- (UIImage *)outputImage;

@end
