//
//  UIView+CRJCaptureImage.m
//  DrawNoteTest
//
//  Created by crj on 2018/8/6.
//  Copyright © 2018年 CRJ. All rights reserved.
//

#import "UIView+CRJCaptureImage.h"

@implementation UIView (CRJCaptureImage)

- (UIImage *)captureImage{
    
    CGSize viewSize = self.bounds.size;

    if([self isKindOfClass:[UIImageView class]]){
        
        UIImageView *imageView = (UIImageView *)self;
        CGSize imageSize = imageView.image.size;
        UIGraphicsBeginImageContextWithOptions(viewSize, NO, imageSize.height/viewSize.height);
    }else{
        UIGraphicsBeginImageContext(viewSize);
    }
    
   
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:contextRef];
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return returnImage;
}

@end
