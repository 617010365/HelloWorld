//
//  ZiXunViewController.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/24.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ZiXunViewController.h"
#import "ZiModel.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJRefresh/MJRefresh.h>
#import "ZiXunHeightCell.h"
#import "ZiXunTableViewCell.h"
@interface ZiXunViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    //最外层数据源：
    NSMutableArray *_dataArray;
    //manuArr数据源：
    NSMutableArray *_manuArray;
    //subArr数据源：
    NSMutableArray *_subArray;
    //subArr内的manuArr数据源：
    NSMutableArray *_manuArray2;
    UITableView *_tableView;
    
    CGFloat cellHeight;
}

@end

@implementation ZiXunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    _dataArray = [[NSMutableArray alloc]init];

    [self loadDataForNet];
}

- (void)loadDataForNet{
    
    NSString *url = [NSString stringWithFormat:ZiXunUrl];
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ZiModel *ziModel = [[ZiModel alloc]initWithData:responseObject error:nil];
        [_dataArray addObject:ziModel];
        if (ziModel.manuArr) {

            [_manuArray addObject:ziModel.manuArr];
        }else if (ziModel.subArr){
        
            [_subArray addObject:ziModel.subArr];
            for (int i = 0; i < _subArray.count; i++) {
                NSMutableArray *subarry = [[NSMutableArray alloc]init];
                SubArrModel *model = _subArray[i];
                for (int j = 0 ; j < model.manuArr.count; j++) {
                    ManuArroneModel *model1 = model.manuArr[i];
                    [subarry addObject:model1];
                }
                [_manuArray2 addObject:subarry];
            }
        }
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",[error description]);
    }];
}


- (void)createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-44-64-40)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
