//
//  YJNoteImageBarView.m
//  gongjubao
//
//  Created by crj on 2018/8/17.
//  Copyright © 2018年 ouyang feng. All rights reserved.
//

#import "YJNoteImageBarView.h"
#import "UIView+Frame.h"

@implementation YJNoteImageBarView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.lastBtn];
        [self addSubview:self.nextBtn];
        [self addSubview:self.doneBtn];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_backBtn sizeToFit];
    _backBtn.yj_height = self.yj_height;
    _backBtn.yj_x = 15;
    
    [_doneBtn sizeToFit];
    _doneBtn.yj_height = self.yj_height;
    _doneBtn.yj_right = self.yj_width - 15;
    
    _nextBtn.yj_height = self.yj_height;
    _nextBtn.yj_width = 80;
    _nextBtn.yj_right = _doneBtn.yj_x - 30;
    
    _lastBtn.yj_height = self.yj_height;
    _lastBtn.yj_width = 80;
    _lastBtn.yj_right = _nextBtn.yj_x - 30;
}

#pragma mark - Actions

- (void)backAction{
    
    if([_delegate respondsToSelector:@selector(noteImageBarBackClick)]){
        [_delegate noteImageBarBackClick];
    }
}

- (void)lastAction{
    
    if([_delegate respondsToSelector:@selector(noteImageBarLastClick)]){
        [_delegate noteImageBarLastClick];
    }
}

- (void)nextAction{
    
    if([_delegate respondsToSelector:@selector(noteImageBarNextClick)]){
        [_delegate noteImageBarNextClick];
    }
}

- (void)doneAction{
    
    if([_delegate respondsToSelector:@selector(noteImageBarDoneClick)]){
        [_delegate noteImageBarDoneClick];
    }
}

#pragma mark - GET

- (UIButton *)backBtn{
    
    if(!_backBtn){
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIButton *)lastBtn{
    
    if(!_lastBtn){
        
        _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_lastBtn setTitle:@"上一步" forState:UIControlStateNormal];
        
        [_lastBtn addTarget:self action:@selector(lastAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lastBtn;
}

- (UIButton *)nextBtn{
    
    if(!_nextBtn){
        
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    
        
        [_nextBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _nextBtn;
}

- (UIButton *)doneBtn{
    
    if(!_doneBtn){
        
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        
        [_doneBtn addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}

@end
