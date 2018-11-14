//
//  YJNoteImageViewController.m
//  gongjubao
//
//  Created by crj on 2018/8/17.
//  Copyright © 2018年 ouyang feng. All rights reserved.
//

#import "CRJNoteImageViewController.h"
#import "CRJNoteImageBarView.h"
#import "CRJDrawImageView.h"
#import "UIView+Frame.h"

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#define IS_IPHONEX (([UIScreen mainScreen].bounds.size.height == 812)?YES:NO)
#define Height_StatusBar (IS_IPHONEX?44.0f: 20.0f)

#define kMinSideSpace 15 //最小边距

@interface CRJNoteImageViewController ()<CRJNoteImageBarViewDelegate>


@property (nonatomic, strong) CRJNoteImageBarView *barView;
@property (nonatomic, strong) CRJDrawImageView *imageView;

@end

@implementation CRJNoteImageViewController

- (void)dealloc
{
    
}

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.imageView.image = image;
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (CGSize)getImageViewSizeWithImageSize:(CGSize)imageSize{
    
    CGFloat maxHeight = self.view.yj_height-_barView.yj_bottom - kMinSideSpace*2;
    CGFloat maxWidth = self.view.yj_width - kMinSideSpace*2;
    CGFloat w_h_scale = imageSize.width/imageSize.height;
    
    CGFloat width = maxWidth;
    CGFloat height = maxHeight;
    
    if(w_h_scale*height>width){
        height = 1/w_h_scale*width;
    }else{
        width = w_h_scale*height;
    }
    
    return CGSizeMake(width, height);
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.barView];
    [self.view addSubview:self.imageView];

    [self imageViewBlock];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    _barView.frame = CGRectMake(0,Height_StatusBar, self.view.yj_width, 44);
    
    _imageView.yj_size = [self getImageViewSizeWithImageSize:_imageView.image.size];
    _imageView.yj_centerX = self.view.yj_width/2;
    _imageView.yj_centerY = (self.view.yj_height-_barView.yj_bottom)/2 + _barView.yj_bottom;
}

- (void)imageViewBlock{
    
    @WeakObj(self);
    _imageView.drawForwardListCountChange = ^(NSInteger count) {
        @StrongObj(self);
        self.barView.nextBtn.enabled = count;
        self.barView.nextBtn.selected = count;
        
    };
    _imageView.drawBackListCountChange = ^(NSInteger count) {
        @StrongObj(self);
        self.barView.lastBtn.enabled = count;
        self.barView.lastBtn.selected = count;
    };
}

#pragma mark - YJNoteImageBarViewDelegate

- (void)noteImageBarBackClick{

    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)noteImageBarLastClick{
    NSLog(@"上一步");
    [_imageView backDraw];
}

- (void)noteImageBarNextClick{
    NSLog(@"下一步");
    [_imageView forwardDraw];
}

- (void)noteImageBarDoneClick{
    
    if(_doneBlcok){
        self.doneBlcok([_imageView outputImage]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - GET

- (CRJNoteImageBarView *)barView{
    
    if(!_barView){
        _barView = [[CRJNoteImageBarView alloc] init];
        _barView.delegate = self;
    }
    return _barView;
}

- (CRJDrawImageView *)imageView{
    
    if(!_imageView){
        _imageView = [[CRJDrawImageView alloc] init];
        _imageView.layer.shadowColor = [UIColor grayColor].CGColor;
        _imageView.layer.shadowOffset = CGSizeMake(7, 7);
        _imageView.layer.shadowOpacity = 0.16;

    }
    return _imageView;
}



@end
