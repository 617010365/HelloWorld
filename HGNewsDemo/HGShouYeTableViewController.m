//
//  HGShouYeTableViewController.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/27.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "HGShouYeTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "TouModel.h"
#import <WebKit/WebKit.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import <MBProgressHUD/MBProgressHUD.h>
@interface HGShouYeTableViewController ()<WKNavigationDelegate,WKUIDelegate>{
    
    TouModel *_touModel;
}
@property (nonatomic, copy) WKWebView *webView;
@property (nonatomic, copy) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation HGShouYeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    [self createView];
}

- (void)createView {
    WKWebViewConfiguration *cofd = [[WKWebViewConfiguration alloc] init];
    
    cofd.accessibilityNavigationStyle = UIAccessibilityNavigationStyleSeparate;
    cofd.allowsInlineMediaPlayback = YES;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-40) configuration:cofd];
    [self.view addSubview:_webView];
    _webView.navigationDelegate = self;
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    _activityIndicatorView.frame = CGRectMake(0, 0, 32, 32);
    _activityIndicatorView.center = self.view.center;
    
    [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:_activityIndicatorView];
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    if (_cellFrame.model.joinPeople && _cellFrame.model.joinPeople.length == 0) {
        
         NSURL *url = [NSURL URLWithString:_cellFrame.model.url];
         NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }else{
        NSString *strurl = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/ipj/clientArticle/?v=3.4&id=%@&page=1&nightMode=0&picOpen=1&fontSize=2&picWidth=500&picHeight=2000&vs=and412&ssid=null&media_ids=1",_cellFrame.model.listid];
        NSURL *url = [NSURL URLWithString:strurl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    [MBProgressHUD hideAllHUDsForView:self.webView animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
