//
//  ViewController.m
//  CRJDrawImageView
//
//  Created by 似云悠 on 2018/9/25.
//  Copyright © 2018年 似云悠. All rights reserved.
//

#import "ViewController.h"
#import "CRJImageViewCell.h"
#import "CRJNoteImageViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setConfig];
    [self makeUI];
}

- (void)setConfig{
    
    _dataSource = [[NSMutableArray alloc] init];
}

- (void)makeUI{
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addEventAction)];
    self.navigationItem.rightBarButtonItem = addItem;
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    _tableView.frame = self.view.bounds;
}

#pragma mark - Event Method

- (void)addEventAction{
    
    UIImage *image = [UIImage imageNamed:@"cpu"];
    
    CRJNoteImageViewController *noteImageVC = [[CRJNoteImageViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:noteImageVC animated:YES];
    
    typeof(self) __weak weakSelf = self;
    noteImageVC.doneBlcok = ^(UIImage *doneImage) {
        [weakSelf.dataSource addObject:doneImage];
        [weakSelf.tableView reloadData];
    };
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *image = _dataSource[indexPath.row];
    CRJImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.cellImageView.image = image;
    return cell;
}

#pragma mark - GET

- (UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CRJImageViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.rowHeight = 100;
    }
    return _tableView;
}


@end
