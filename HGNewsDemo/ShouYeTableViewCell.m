//
//  ShouYeTableViewCell.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ShouYeTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ShouYeTableViewCell{

    UIImageView *_imageone;
    UILabel *_Toutitle;
    UILabel *_Toutime;
    UILabel *_Touping;
    
    UIImageView *_image1;
    UIImageView *_image2;
    UIImageView *_image3;
    //新闻：
    UIImageView *_imagenew1;
    UIImageView *_imagenew2;
    UIImageView *_imagenew3;
    
    UIImageView *_imagenewone;

    UILabel *_Newtitle;
    UILabel *_Newtime;
    UILabel *_Newping;
    //直播：
    UIImageView *_imageBoone;
    
    UILabel *_Botitle;
    UILabel *_Botime;
    UILabel *_Boping;
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

    _imageone = [UIImageView new];
    [self.contentView addSubview:_imageone];
    
    _image1 = [UIImageView new];
    [self.contentView addSubview:_image1];
    _image2 = [UIImageView new];
    [self.contentView addSubview:_image2];
    _image3 = [UIImageView new];
    [self.contentView addSubview:_image3];
    
    _Toutitle = [[UILabel alloc]init];
    _Toutime = [[UILabel alloc]init];
    _Touping = [[UILabel alloc]init];
    _Toutitle.numberOfLines = 2;
    _Toutitle.font = [UIFont systemFontOfSize:20];
    _Toutime.font = [UIFont systemFontOfSize:13];
    _Touping.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_Toutitle];
    [self.contentView addSubview:_Toutime];
    [self.contentView addSubview:_Touping];
    //新闻：
    _imagenewone = [UIImageView new];
    [self.contentView addSubview:_imagenewone];
    _imagenew1 = [UIImageView new];
    [self.contentView addSubview:_imagenew1];
    _imagenew2 = [UIImageView new];
    [self.contentView addSubview:_imagenew2];
    _imagenew3 = [UIImageView new];
    [self.contentView addSubview:_imagenew3];
    
    _Newtitle = [[UILabel alloc]init];
    _Newtime = [[UILabel alloc]init];
    _Newping = [[UILabel alloc]init];
    _Newtitle.numberOfLines = 2;
    
    _Newtitle.font = [UIFont systemFontOfSize:20];
    _Newtime.font = [UIFont systemFontOfSize:13];
    _Newping.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_Newtitle];
    [self.contentView addSubview:_Newtime];
    [self.contentView addSubview:_Newping];
    //直播：
    _imageBoone = [UIImageView new];
    [self.contentView addSubview:_imageBoone];
    
    _Botitle = [[UILabel alloc]init];
    _Botime = [[UILabel alloc]init];
    _Boping = [[UILabel alloc]init];
    _Botitle.numberOfLines = 2;
    _Botitle.font = [UIFont systemFontOfSize:20];
    _Botime.font = [UIFont systemFontOfSize:13];
    _Boping.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_Botitle];
    [self.contentView addSubview:_Botime];
    [self.contentView addSubview:_Boping];
}

- (void)setCellFrame:(ShouYeHeightCell *)cellFrame{

    _cellFrame = cellFrame;
    _imageone.frame = _cellFrame.imageoneFrame;
//    [_imageone sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.imgsrc]];
    
    _image1.frame = _cellFrame.image1Frame;
    _image2.frame = _cellFrame.image2Frame;
    _image3.frame = _cellFrame.image3Frame;
    if (_cellFrame.model.pics.count == 3) {
//        [_image1 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[0]]];
//        [_image2 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[1]]];
//        [_image3 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[2]]];
    }
    _Toutitle.frame = _cellFrame.ToutitleFrame;
    _Toutitle.text = _cellFrame.model.stitle;
    _Toutime.frame = _cellFrame.ToutimeFrame;
    _Toutime.text = _cellFrame.model.sdate;
    _Touping.frame = _cellFrame.ToupingFrame;

    if (_cellFrame.model.joinPeople && _cellFrame.model.joinPeople.length == 0) {
        _Touping.text = [NSString stringWithFormat:@"抢沙发"];
        
    }else if (_cellFrame.model.play_count){
    
        _Touping.text = [NSString stringWithFormat:@"播放数:%@",_cellFrame.model.play_count];
    }else{
    
        _Touping.text = [NSString stringWithFormat:@"评论数:%@",_cellFrame.model.joinPeople];
    }
    //新闻：
    _imagenewone.frame = _cellFrame.imagenewoneFrame;
    _imagenew1.frame = _cellFrame.imagenew1Frame;
    _imagenew2.frame = _cellFrame.imagenew2Frame;
    _imagenew3.frame = _cellFrame.imagenew3Frame;
//    [_imagenewone sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.imgsrc]];
    
    if (_cellFrame.model.pics.count == 3) {
    
//        [_imagenew1 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[0]]];
//        [_imagenew2 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[1]]];
//        [_imagenew3 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[2]]];
    }else if (_cellFrame.model.pics.count == 1){
//    
//        [_imagenew1 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[0]]];
    }else {
//    
//        [_imagenew1 sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.imgsrc]];
    }
    _Newtitle.frame = _cellFrame.NewtitleFrame;
    _Newtitle.text = _cellFrame.model.stitle;
    _Newtime.frame = _cellFrame.NewtimeFrame;
    _Newtime.text = _cellFrame.model.sdate;
    _Newping.text = [NSString stringWithFormat:@"评论数:%@",_cellFrame.model.joinPeople];
    //直播：
    _imageBoone.frame = _cellFrame.imageBooneFrame;
    if (_cellFrame.model.pics.count == 1) {
        [_imageBoone sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.pics[0]]];
    }else if (_cellFrame.model.pics.count == 0){
    
        [_imageBoone sd_setImageWithURL:[NSURL URLWithString:_cellFrame.model.imgsrc]];
    }
    _Botitle.frame = _cellFrame.BotitleFrame;
    _Botitle.text = _cellFrame.model.stitle;
    _Botime.frame = _cellFrame.BotimeFrame;
    _Botime.text = _cellFrame.model.sdate;
    _Boping.frame = _cellFrame.BopingFrame;
    _Boping.text = [NSString stringWithFormat:@"%@人参与",_cellFrame.model.joinPeople];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
