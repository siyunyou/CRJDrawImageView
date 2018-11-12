//
//  YJNoteImageBarView.h
//  gongjubao
//
//  Created by crj on 2018/8/17.
//  Copyright © 2018年 ouyang feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJNoteImageBarViewDelegate <NSObject>

- (void)noteImageBarBackClick;
- (void)noteImageBarLastClick;
- (void)noteImageBarNextClick;
- (void)noteImageBarDoneClick;

@end

@interface YJNoteImageBarView : UIView

@property (nonatomic, weak) id <YJNoteImageBarViewDelegate>delegate;

@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIButton *doneBtn;

@end
