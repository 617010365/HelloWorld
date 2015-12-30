//
//  SXTitleLabel.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "SXTitleLabel.h"

@implementation SXTitleLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:20];
        self.scale = 0.0;
    }
    return self;
}

- (void)setScale:(CGFloat)scale{

    _scale = scale;
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1];
    
    CGFloat minScale = 0.7;
    CGFloat trueScale = minScale + (1-minScale)*scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}

@end
