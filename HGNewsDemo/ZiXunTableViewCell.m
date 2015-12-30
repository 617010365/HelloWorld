//
//  ZiXunTableViewCell.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/28.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ZiXunTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ZiXunTableViewCell{

    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_oneLabel;
    UILabel *_twoLabel;
    UILabel *_threeLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customViews];
    }
    return self;
}

- (void)customViews{

    _imageView = [UIImageView new];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _oneLabel = [UILabel new];
    _oneLabel.font = [UIFont systemFontOfSize:13];
    _twoLabel = [UILabel new];
    _twoLabel.font = [UIFont systemFontOfSize:13];
    _threeLabel = [UILabel new];
    _threeLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_oneLabel];
    [self.contentView addSubview:_twoLabel];
    [self.contentView addSubview:_threeLabel];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
