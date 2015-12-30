//
//  ZiXunHeightCell.h
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/28.
//  Copyright © 2015年 何光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZiModel.h"
#import <UIKit/UIKit.h>
@interface ZiXunHeightCell : NSObject

@property (nonatomic, assign, readonly) CGRect imageFrame;
@property (nonatomic, assign, readonly) CGRect ZItitleFrame;
@property (nonatomic, assign, readonly) CGRect ZioneFrame;
@property (nonatomic, assign, readonly) CGRect ZitwoFrame;
@property (nonatomic, assign, readonly) CGRect ZithreeFrame;

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, strong) ZiModel *model;
@end
