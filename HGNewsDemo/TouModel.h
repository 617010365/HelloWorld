//
//  TouModel.h
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PicsModel
@end
@interface PicsModel :JSONModel
@property (nonatomic, copy) NSString<Optional> *picsid;
@property (nonatomic, copy) NSString<Optional> *stitle;
@property (nonatomic, copy) NSString<Optional> *imgsrc;
@property (nonatomic, copy) NSString<Optional> *imgsrc2;
@property (nonatomic, copy) NSString<Optional> *type;
@property (nonatomic, copy) NSString<Optional> *url;
@end

@protocol ListModel
@end
@interface ListModel :JSONModel
@property (nonatomic, copy) NSString<Optional> *stitle;
@property (nonatomic, copy) NSString<Optional> *sdate;
@property (nonatomic, copy) NSString<Optional> *url;
@property (nonatomic, copy) NSString<Optional> *imgsrc2;
@property (nonatomic, copy) NSString<Optional> *imgsrc;
@property (nonatomic, copy) NSString<Optional> *bookid;
@property (nonatomic, copy) NSString<Optional> *listid;
@property (nonatomic, copy) NSString<Optional> *label;
@property (nonatomic, copy) NSString<Optional> *isPrize;
@property (nonatomic, copy) NSString<Optional> *isDefaultImg;
@property (nonatomic, copy) NSString<Optional> *joinPeople;
@property (nonatomic, copy) NSString<Optional> *live_num;
@property (nonatomic, copy) NSString<Optional> *play_count;
@property (nonatomic, strong) NSMutableArray<Optional> *pics;
@end

@interface TouModel : JSONModel
@property (nonatomic, strong) NSMutableArray<ListModel,Optional> *list;
@property (nonatomic, strong) NSMutableArray<PicsModel,Optional> *pics;
@end
