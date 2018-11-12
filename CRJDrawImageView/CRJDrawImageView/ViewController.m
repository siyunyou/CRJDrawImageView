//
//  ViewController.m
//  CRJDrawImageView
//
//  Created by 似云悠 on 2018/9/25.
//  Copyright © 2018年 似云悠. All rights reserved.
//

#import "ViewController.h"

#import "YJNoteImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"cpu"];
    
    YJNoteImageViewController *noteImageVC = [[YJNoteImageViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:noteImageVC animated:YES];
    
    noteImageVC.doneBlcok = ^(UIImage *doneImage) {
        
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
