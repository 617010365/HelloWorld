//
//  ShouYeController.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/25.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ShouYeController.h"
#import "TouModel.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJRefresh/MJRefresh.h>
#import "ShouYeHeightCell.h"
#import "ShouYeTableViewCell.h"
#import "HGShouYeTableViewController.h"
@interface ShouYeController ()<UITableViewDataSource,UITableViewDelegate>{

    NSMutableArray *_dataSource;
    NSMutableArray *_dataArray;

    UITableView *_tableView;
    UIScrollView *_scrollView;
    
    CGFloat cellHeight;
}

@end

@implementation ShouYeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self createScrollView];
    _dataArray = [[NSMutableArray alloc]init];
    _dataSource = [[NSMutableArray alloc]init];
}

- (void)setUrlString:(NSString *)urlString{

    _urlString = urlString;
}

- (void)loadDataForNet:(BOOL)isMore{

    NSInteger page = 1;
    if (isMore) {
        page = _dataArray.count/15 + 1;
        [_tableView.mj_footer endRefreshing];
    }
    NSString *url = [NSString stringWithFormat:_urlString,page];
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!isMore) {
            [_dataSource removeAllObjects];
            [_tableView reloadData];
        }
        TouModel *touModel = [[TouModel alloc]initWithData:responseObject error:nil];
        [_dataSource addObjectsFromArray:touModel.pics];
        for (ListModel *mode in touModel.list) {
            ShouYeHeightCell *cellframe = [ShouYeHeightCell new];
            cellframe.model = mode;
            [_dataArray addObject:cellframe];
        }
        //判断是否存在滚动视图：
        if (touModel.pics) {
               [self createScrollImage];
          
        }
        [_tableView reloadData];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",[error description]);
    }];
}

- (void)createScrollView{

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
    _scrollView.backgroundColor = [UIColor cyanColor];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*_dataSource.count, self.view.frame.size.height/3);
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
   _tableView.tableHeaderView = _scrollView;
}

- (void)createScrollImage {
    //DataModel *model = _dataSource[0];
    //NSLog(@"%@",_dataSource);
    for (int i = 0; i < _dataSource.count; i++) {
        PicsModel *model1 = _dataSource[i];
        UIImageView *imgeView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, _scrollView.frame.size.height-20, self.view.frame.size.width, 20)];
        label.text = model1.stitle;
        label.textColor = [UIColor whiteColor];
        [imgeView addSubview:label];
        imgeView.backgroundColor = [UIColor grayColor];
//        [imgeView sd_setImageWithURL:[NSURL URLWithString:model1.imgsrc]];
        [_scrollView addSubview:imgeView];
    }
}

- (void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-44-64-40)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _scrollView;
    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataForNet:NO];
    }];
    _tableView.mj_header = refreshHeader;
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadDataForNet:YES];
    }];
    _tableView.mj_footer = refreshFooter;
    [refreshHeader beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cellIdentifier";
    ShouYeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShouYeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    // NSLog(@"%@",_dataArray);
    cell.cellFrame = _dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShouYeHeightCell *cellFrame = _dataArray[indexPath.row];
    return cellFrame.cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HGShouYeTableViewController *pointView = [[HGShouYeTableViewController alloc]init];
    pointView.cellFrame = _dataArray[indexPath.row];
    [self.navigationController pushViewController:pointView animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end










