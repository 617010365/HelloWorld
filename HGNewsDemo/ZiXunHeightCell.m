//
//  ZiXunHeightCell.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/28.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ZiXunHeightCell.h"

@implementation ZiXunHeightCell

- (void)setModel:(ZiModel *)model{

    _model = model;
    CGFloat leftPadding = 20.0;
    CGFloat toppadding = 10.0;
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen]bounds]);
    _imageFrame = CGRectMake(leftPadding, toppadding, 60, 60);
    _ZItitleFrame = CGRectMake(CGRectGetMaxX(_imageFrame)+leftPadding, toppadding, width-CGRectGetMaxX(_imageFrame)-leftPadding*2, 25);
    _ZioneFrame = CGRectMake(CGRectGetMaxX(_imageFrame)+leftPadding, CGRectGetMaxY(_ZItitleFrame)+toppadding, CGRectGetWidth(_ZItitleFrame)/3, 14);
    _ZitwoFrame = CGRectMake(CGRectGetMaxX(_ZioneFrame)+leftPadding/2,CGRectGetMaxY(_ZItitleFrame)+toppadding, CGRectGetWidth(_ZItitleFrame)/3, 14);
    _ZithreeFrame = CGRectMake(CGRectGetMaxX(_ZitwoFrame)+leftPadding/2,CGRectGetMaxY(_ZItitleFrame)+toppadding, CGRectGetWidth(_ZItitleFrame)/3, 14);
    _cellHeight = CGRectGetMaxY(_imageFrame)+toppadding;
}

@end
