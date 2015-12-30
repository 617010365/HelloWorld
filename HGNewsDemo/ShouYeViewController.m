//
//  ShouYeViewController.m
//  HGNewsDemo
//
//  Created by Qianfeng on 15/12/24.
//  Copyright © 2015年 何光. All rights reserved.
//

#import "ShouYeViewController.h"
#import "SXTitleLabel.h"
#import "ShouYeController.h"
//上面滑动栏的高度：
#define smallScrollMenuH 40
@interface ShouYeViewController ()<UIScrollViewDelegate>
//大的滑动视图
@property (nonatomic, weak) UIScrollView *bigScroll;
//小的滑动视图
@property (nonatomic, weak) UIScrollView *smallScroll;

@property (nonatomic, strong) SXTitleLabel *oldTitleLabel;
@property (nonatomic, assign) CGFloat beginOffsetX;

//新闻接口的数组：
@property (nonatomic, strong) NSArray *arrayLists;

@end

@implementation ShouYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    //添加滑动视图
    [self setupScrollView];
}
//懒加载新闻数据：
- (NSArray *)arrayLists{

    if (_arrayLists == nil) {
        _arrayLists = @[@[ToutiaoUrl,@"头条"],@[NewsUrl,@"新闻"],@[PingceUrl,@"评测"],@[PhoneUrl,@"手机"],@[ShumaUrl,@"数码"],@[ComputerUrl,@"电脑"],@[ZanjiUrl,@"攒机"],@[WaisheUrl,@"外设"],@[DaogouUrl,@"导购"],@[RebangUrl,@"热榜"],@[ZhiboUrl,@"直播"]];
    }
    return _arrayLists;
}
//添加滑动视图:
- (void)setupScrollView{

    self.automaticallyAdjustsScrollViewInsets = NO;
    //添加小的滚动菜单栏：
    UIScrollView *smallScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, smallScrollMenuH)];
    [self.view addSubview:smallScroll];
    smallScroll.showsHorizontalScrollIndicator = NO;
    smallScroll.showsVerticalScrollIndicator = NO;
    self.smallScroll = smallScroll;
    
    //添加大的滚动菜单栏：
    UIScrollView *bigScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+smallScrollMenuH, ScreenWidth, (ScreenHeight-smallScrollMenuH-64))];
    bigScroll.showsHorizontalScrollIndicator = NO;
    bigScroll.delegate = self;
    [self.view addSubview:bigScroll];
    self.bigScroll = bigScroll;
    
    //添加子控制器：
    [self addController];
    //添加标题栏：
    [self addLabel];
    //设置大的scrollview的滚动范围：
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScroll.contentSize = CGSizeMake(contentX, 0);
    self.bigScroll.pagingEnabled = YES;
    
    //添加默认子控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScroll.bounds;
    [self.bigScroll addSubview:vc.view];
    SXTitleLabel *lable = [self.smallScroll.subviews firstObject];
    lable.scale = 1.0;
}
- (void)addController{

    for (int i = 0; i < self.arrayLists.count; i++) {
        ShouYeController *vc = [[ShouYeController alloc]init];
        vc.title = self.arrayLists[i][1];
        vc.urlString = self.arrayLists[i][0];
        [self addChildViewController:vc];
    }
}

- (void)addLabel{

    CGFloat lblW = 70;
    CGFloat lblH = 40;
    CGFloat lblY = 0;
    CGFloat lblX =0;
    for (int i = 0 ; i < self.arrayLists.count ;i++){
        lblX = i * lblW;
        SXTitleLabel *lbl1 = [[SXTitleLabel alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont fontWithName:@"HYQiHei" size:19];
        [self.smallScroll addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    //设置小scroll滚动的范围
    self.smallScroll.contentSize=CGSizeMake(lblW*self.arrayLists.count, 0);
}

#pragma mark 标签栏的点击事件
-(void)lblClick:(UITapGestureRecognizer *)recognizer
{
    SXTitleLabel *titlelable = (SXTitleLabel *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * self.bigScroll.frame.size.width;
    
    CGFloat offsetY = self.bigScroll.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    
    [self.bigScroll setContentOffset:offset animated:YES];
}

#pragma mark - ******************** scrollView代理方法
/** 滚动结束（手势导致） */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/** 滚动结束后调用（代码导致） */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView

{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScroll.frame.size.width;
    
    // 滚动标题栏
    SXTitleLabel *titleLable = (SXTitleLabel *)self.smallScroll.subviews[index];
    
    CGFloat offsetx = titleLable.center.x - self.smallScroll.frame.size.width * 0.5;
    
    CGFloat offsetMax = self.smallScroll.contentSize.width - self.smallScroll.frame.size.width;
    
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    
    CGPoint offset = CGPointMake(offsetx, self.smallScroll.contentOffset.y);
    //  NSLog(@"%@",NSStringFromCGPoint(offset));
    [self.smallScroll setContentOffset:offset animated:YES];
    // 添加控制器
    ShouYeController *newsVc = self.childViewControllers[index];
    newsVc.index = index;
    
    [self.smallScroll.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index) {
            SXTitleLabel *temlabel = self.smallScroll.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    
    if (newsVc.view.superview) return;
    
    newsVc.view.frame = scrollView.bounds;
    [self.bigScroll addSubview:newsVc.view];
}

/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    SXTitleLabel *labelLeft = self.smallScroll.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScroll.subviews.count) {
        
        SXTitleLabel *labelRight = self.smallScroll.subviews[rightIndex];
        
        labelRight.scale = scaleRight;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
