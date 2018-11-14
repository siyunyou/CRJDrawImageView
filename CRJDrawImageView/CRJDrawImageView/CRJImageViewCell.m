//
//  CRJImageViewCell.m
//  CRJDrawImageView
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018 似云悠. All rights reserved.
//

#import "CRJImageViewCell.h"

@implementation CRJImageViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellImageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _cellImageView.frame = self.contentView.bounds;
}

#pragma mark - GET

- (UIImageView *)cellImageView{
    
    if(!_cellImageView){
        _cellImageView = [[UIImageView alloc] init];
        _cellImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _cellImageView;
}

@end
