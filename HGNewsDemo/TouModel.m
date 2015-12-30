//
//  TouModel.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "TouModel.h"

@implementation ListModel
+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"listid"}];
}
@end

@implementation PicsModel
+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"picsid"}];
}
@end

@implementation TouModel

@end
