//
//  YJNoteImageViewController.h
//  gongjubao
//
//  Created by crj on 2018/8/17.
//  Copyright © 2018年 ouyang feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRJNoteImageViewController : UIViewController

@property (nonatomic, copy) void (^doneBlcok)(UIImage *doneImage);

- (id)initWithImage:(UIImage *)image;

@end
