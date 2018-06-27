//
//  TestVC.m
//  XMGFM
//
//  Created by 王顺子 on 16/11/9.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "TestVC.h"
#import "XMGSegmentBar.h"
#import "UIView+XMGLayout.h"

#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 共有的间距
#define kCommonMargin 10
// 发现 顶部 菜单栏的高度
#define kMenueBarHeight 35
// 导航栏的高度
#define kNavigationBarMaxY 64
// tabbar的高度
#define kTabbarHeight 0


// 随机颜色
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define XMGColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define XMGAlphaColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define XMGRandomColor XMGColor(arc4random_uniform(255.0), arc4random_uniform(255.0), arc4random_uniform(255.0))
#define kCommonColor XMGColor(223, 223, 223)


@interface TestVC ()<UIScrollViewDelegate, XMGSegmentBarDelegate>


@property (nonatomic, strong) NSArray *categoryMs;
@property (nonatomic, strong) XMGSegmentBar *segmentBar;
@property (nonatomic, strong) UIScrollView *contentScrollView;


@end

@implementation TestVC


-(XMGSegmentBar *)segmentBar
{
    if (!_segmentBar) {
        XMGSegmentConfig *config = [XMGSegmentConfig defaultConfig];
        config.isShowMore = YES;
        _segmentBar = [XMGSegmentBar segmentBarWithConfig:config];
        _segmentBar.y = kNavigationBarMaxY;
        _segmentBar.backgroundColor = [UIColor whiteColor];
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}

-(UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarMaxY + self.segmentBar.height, kScreenWidth, kScreenHeight - (kNavigationBarMaxY + self.segmentBar.height))];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(scrollView.width * self.childViewControllers.count, 0);
        _contentScrollView = scrollView;
    }
    return _contentScrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.tag = 666;
    self.view.backgroundColor = [UIColor redColor];
    
    
    _categoryMs = @[@"11111",@"2222",@"333",@"4444",@"5555",@"6666",@"7777",@"88888",@"99999",@"1000"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kCommonColor;
    
    // 2. 添加内容视图
    [self.view addSubview:self.contentScrollView];
    
    // 1. 设置菜单栏
    [self.view addSubview:self.segmentBar];
    
    
    [self setUpWithItems:_categoryMs];
    
    [self.segmentBar updateViewWithConfig:^(XMGSegmentConfig *config) {
        
    }];
}

- (void)setUpWithItems: (NSArray <NSString *>*)items {
    
    // 0.添加子控制器
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    for (int i = 0; i < items.count; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = XMGRandomColor;
        [self addChildViewController:vc];
    }
    
    // 1. 设置菜单项展示
    self.segmentBar.segmentMs = items;
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.width * items.count, 0);
    
    self.segmentBar.selectedIndex = 0;
}

- (void)showControllerView:(NSInteger)index {
    
    UIViewController *cvc = self.childViewControllers[index];
    //    cvc.loadKey = self.categoryMs[index];
    UIView *view = cvc.view;
    CGFloat contentViewW = self.contentScrollView.width;
    view.frame = CGRectMake(contentViewW * index, 0, contentViewW, self.contentScrollView.height);
    [self.contentScrollView addSubview:view];
    [self.contentScrollView setContentOffset:CGPointMake(contentViewW * index, 0) animated:YES];
    
}

- (void)segmentBarDidSelectIndex:(NSInteger)selectedIndex fromIndex:(NSInteger)fromIndex
{
    [self showControllerView:selectedIndex];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.width;
    self.segmentBar.selectedIndex = page;
    
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


//    NSLog(@"摸到我了");
//    static BOOL isPlay = NO;
//    isPlay = !isPlay;
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
//    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
////
//    [self.navigationController pushViewController:[TestVC2 new] animated:YES];



}
@end
