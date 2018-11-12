//
//  CRJDrawImageView.m
//  DrawNoteTest
//
//  Created by crj on 2018/7/11.
//  Copyright © 2018年 CRJ. All rights reserved.
//

#import "CRJDrawImageView.h"
#import "CRJStack.h"
#import "UIView+CRJCaptureImage.h"

@interface CRJDrawImageView()

//layer存储栈
@property (nonatomic, strong) CRJStack *drawStack;
//layer删除存储栈
@property (nonatomic, strong) CRJStack *removeStack;

@end

@implementation CRJDrawImageView{
    
    //路径
    UIBezierPath *_bezierPath;
    CAShapeLayer *_currentShapeLayer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        _lineWidth = 10.0;
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - Publick

- (BOOL)canBack{
    return ![self.drawStack isEmpty];
}

- (BOOL)canForward{
    return ![self.removeStack isEmpty];
}

- (UIImage *)outputImage{
    
    return [self captureImage];
}

- (void)backDraw{
    
    CAShapeLayer *shapeLayer = [self.drawStack popObj];
    if(shapeLayer){
        [shapeLayer removeFromSuperlayer];
        [self.removeStack push:shapeLayer];
    }
    
    [self stackChange];
}

- (void)forwardDraw{
    
    CAShapeLayer *shapeLayer = [self.removeStack popObj];
    if(shapeLayer){
        [self.layer addSublayer:shapeLayer];
        [self.drawStack push:shapeLayer];
    }
    
    [self stackChange];
}

- (void)stackChange{
    
    if(_drawBackListCountChange){
        self.drawBackListCountChange([self.drawStack stackLength]);
    }
    if(_drawForwardListCountChange){
        self.drawForwardListCountChange([self.removeStack stackLength]);
    }
}

#pragma mark - Private

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.removeStack removeAllObjects];
    
    CGPoint point = [[touches anyObject] locationInView:self];

    
    _currentShapeLayer = [CAShapeLayer layer];
    _currentShapeLayer.frame = self.layer.bounds;
    _currentShapeLayer.masksToBounds = YES;
    [self.layer addSublayer:_currentShapeLayer];
    
    [self.drawStack push:_currentShapeLayer];
    
    _currentShapeLayer.strokeColor = _strokeColor.CGColor;
    _currentShapeLayer.fillColor = [UIColor clearColor].CGColor;
    _currentShapeLayer.lineJoin = kCALineJoinRound;
    _currentShapeLayer.lineCap = kCALineCapRound;
    _currentShapeLayer.lineWidth = _lineWidth;
    
    _bezierPath = [UIBezierPath new];
    [_bezierPath moveToPoint:point];
    _currentShapeLayer.path = _bezierPath.CGPath;

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];

    [_bezierPath addLineToPoint:point];
    _currentShapeLayer.path = _bezierPath.CGPath;

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self];
    [_bezierPath addLineToPoint:point];
    _currentShapeLayer.path = _bezierPath.CGPath;

    [self stackChange];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}




#pragma mark - GET

- (CRJStack *)drawStack{
    
    if(!_drawStack){
        _drawStack = [[CRJStack alloc] init];
    }
    return _drawStack;
}

- (CRJStack *)removeStack{
    
    if(!_removeStack){
        _removeStack = [[CRJStack alloc] init];
    }
    return _removeStack;
}



@end
