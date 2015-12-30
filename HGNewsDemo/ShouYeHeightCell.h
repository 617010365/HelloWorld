//
//  ShouYeHeightCell.h
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TouModel.h"
@interface ShouYeHeightCell : NSObject
//头条：
@property (nonatomic, assign, readonly) CGRect imageoneFrame;
@property (nonatomic, assign, readonly) CGRect ToutitleFrame;
@property (nonatomic, assign, readonly) CGRect ToutimeFrame;
@property (nonatomic, assign, readonly) CGRect ToupingFrame;

@property (nonatomic, assign, readonly) CGRect image1Frame;
@property (nonatomic, assign, readonly) CGRect image2Frame;
@property (nonatomic, assign, readonly) CGRect image3Frame;
//新闻：

@property (nonatomic, assign, readonly) CGRect imagenew1Frame;
@property (nonatomic, assign, readonly) CGRect imagenew2Frame;
@property (nonatomic, assign, readonly) CGRect imagenew3Frame;

@property (nonatomic, assign, readonly) CGRect imagenewoneFrame;
@property (nonatomic, assign, readonly) CGRect NewtitleFrame;
@property (nonatomic, assign, readonly) CGRect NewtimeFrame;
@property (nonatomic, assign, readonly) CGRect NewpingFrame;

//直播：
@property (nonatomic, assign, readonly) CGRect imageBooneFrame;
@property (nonatomic, assign, readonly) CGRect BotitleFrame;
@property (nonatomic, assign, readonly) CGRect BotimeFrame;
@property (nonatomic, assign, readonly) CGRect BopingFrame;

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, strong) ListModel *model;
@end
