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
#import "Base.h"



#define iPhoneX (kScreenHeight >= 812.0)

//iPhoneX状态栏的高度 44
#define kState_Height (iPhoneX ? 44.0 : 20.0)
//NavigationBar的高度 44
#define kNavigationBar_Height 44.0
#define SafeAreaTopHeight (kScreenHeight >= 812.0 ? 88 : 64)
#define statusTopHeight (kScreenHeight >= 812.0 ? 44 : 20)
#define SafeAreaTabBarpHeight (kScreenHeight >= 812.0 ? 83 : 49)


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
        _segmentBar.y = SafeAreaTopHeight;
        _segmentBar.backgroundColor = [UIColor whiteColor];
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}

-(UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight + self.segmentBar.height, kScreenWidth, kScreenHeight - (SafeAreaTopHeight + self.segmentBar.height))];
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
