//
//  ShouYeHeightCell.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ShouYeHeightCell.h"

@implementation ShouYeHeightCell

- (void)setModel:(ListModel *)model{

    _model = model;
    CGFloat leftPadding = 10.0;
    CGFloat rightPadding = 15.0;
    CGFloat toppadding = 12.0;
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen]bounds]);
    if (!model.pics && model.imgsrc.length != 0) {
        _imageoneFrame = CGRectMake(leftPadding, toppadding, 60, 60);
        _ToutitleFrame = CGRectMake(CGRectGetMaxX(_imageoneFrame)+leftPadding, toppadding, (width-CGRectGetMaxX(_imageoneFrame)-leftPadding-rightPadding), 50);
        _ToutimeFrame = CGRectMake(CGRectGetMaxX(_imageoneFrame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+5, (width-CGRectGetMaxX(_imageoneFrame)-leftPadding-8*rightPadding), 13);
        _ToupingFrame = CGRectMake(CGRectGetMaxX(_ToutimeFrame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+5, (width-CGRectGetMaxX(_ToutimeFrame)-leftPadding), 13);
        _cellHeight = CGRectGetMaxY(_ToutimeFrame) + toppadding;
    }else if (!model.pics && model.imgsrc.length == 0) {
        _ToutitleFrame = CGRectMake(leftPadding, toppadding, width-rightPadding-leftPadding, 50);
        _ToutimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_ToutitleFrame)+toppadding, width-leftPadding-rightPadding*2,13);
        _ToupingFrame = CGRectMake(CGRectGetMaxX(_ToutimeFrame)+rightPadding, CGRectGetMaxY(_ToutimeFrame)+rightPadding, 3*rightPadding, 13);
        _cellHeight = CGRectGetMaxY(_ToutimeFrame) + toppadding;
    }else if (model.label && model.pics){
    
        _ToutitleFrame = CGRectMake(leftPadding, toppadding, width-2*leftPadding, 50);
        _image1Frame = CGRectMake(leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _image2Frame = CGRectMake(CGRectGetMaxX(_image1Frame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _image3Frame = CGRectMake(CGRectGetMaxX(_image2Frame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _ToutimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_image1Frame)+leftPadding, width-4*rightPadding, 13);
        _ToupingFrame = CGRectMake(CGRectGetMaxX(_image3Frame)-3*rightPadding, CGRectGetMaxY(_image3Frame)+leftPadding, 4*rightPadding, 13);
        _cellHeight = CGRectGetMaxY(_ToutimeFrame)+toppadding;
    }else if (!model.label && model.pics.count == 3 && !model.isDefaultImg){
        
        _ToutitleFrame = CGRectMake(leftPadding, toppadding, width-2*leftPadding, 50);
        _image1Frame = CGRectMake(leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _image2Frame = CGRectMake(CGRectGetMaxX(_image1Frame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _image3Frame = CGRectMake(CGRectGetMaxX(_image2Frame)+leftPadding, CGRectGetMaxY(_ToutitleFrame)+leftPadding, (width-4*leftPadding)/3, (width-4*leftPadding)*2/9);
        _ToutimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_image1Frame)+leftPadding, width-4*rightPadding, 13);
        _ToupingFrame = CGRectMake(CGRectGetMaxX(_image3Frame)-8*rightPadding, CGRectGetMaxY(_image3Frame)+leftPadding, 8*rightPadding, 13);
        _cellHeight = CGRectGetMaxY(_ToutimeFrame)+toppadding;
    }else if (!model.label && model.pics.count == 0 && !model.isDefaultImg && model.imgsrc){
    
        _NewtitleFrame = CGRectMake(leftPadding, toppadding, width-rightPadding-leftPadding, 50);
        _NewtimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_NewtitleFrame)+toppadding, width-leftPadding-rightPadding*2,13);
        _NewpingFrame = CGRectMake(CGRectGetMaxX(_NewtimeFrame)+rightPadding, CGRectGetMaxY(_NewtimeFrame)+rightPadding, 3*rightPadding, 13);
        _cellHeight = CGRectGetMaxY(_NewtimeFrame)+toppadding;
    }else if (!model.label && model.pics.count == 1 && !model.isDefaultImg && model.imgsrc){
    
        _NewtitleFrame = CGRectMake(leftPadding, toppadding, width-leftPadding*3-75, 50);
        _imagenewoneFrame = CGRectMake(CGRectGetMaxX(_NewtitleFrame)+leftPadding, toppadding, 75, 75);
        _NewtimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_NewtitleFrame)+toppadding, 10*rightPadding, 13);
        _cellHeight = CGRectGetMaxY(_NewtimeFrame)+toppadding;
    }else if (!model.label && model.isPrize && model.isDefaultImg){
    
        _imageBooneFrame = CGRectMake(leftPadding, toppadding, width-2*leftPadding, 75);
        _BotitleFrame = CGRectMake(leftPadding, CGRectGetMaxY(_imageBooneFrame)+5, CGRectGetWidth(_imageBooneFrame), 50);
        _BotimeFrame = CGRectMake(leftPadding, CGRectGetMaxY(_BotitleFrame)+toppadding/2, CGRectGetWidth(_BotitleFrame)/2, 13);
        _BopingFrame = CGRectMake(CGRectGetWidth(_BotitleFrame)-60, CGRectGetMaxY(_BotitleFrame)+toppadding/2, CGRectGetWidth(_BotitleFrame)/2, 13);
        _cellHeight = CGRectGetMaxY(_BotimeFrame)+toppadding;
    }
}

@end





