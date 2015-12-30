//
//  ZiModel.h
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/28.
//  Copyright © 2015年 何光. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ManuArroneModel
@end
@interface ManuArroneModel :JSONModel
@property (nonatomic, copy) NSString<Optional> *Moneid;
@property (nonatomic, copy) NSString<Optional> *name;
@end

@protocol SubArrModel
@end
@interface SubArrModel :JSONModel
@property (nonatomic, copy) NSString<Optional> *Sid;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, strong) NSMutableArray<ManuArroneModel,Optional> *manuArr;
@end

@protocol ManuArrModel
@end
@interface ManuArrModel :JSONModel
@property (nonatomic, copy) NSString<Optional> *Mid;
@property (nonatomic, copy) NSString<Optional> *name;
@end

@interface ZiModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *src;
@property (nonatomic, copy) NSString<Optional> *subId;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *proNum;
@property (nonatomic, copy) NSString<Optional> *type;
@property (nonatomic, strong) NSMutableArray<ManuArrModel,Optional> *manuArr;
@property (nonatomic, strong) NSMutableArray<SubArrModel,Optional> *subArr;
@end
