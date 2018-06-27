//
//  XMGNavBar.m
//  XMGLY-Parts
//
//  Created by 王顺子 on 16/9/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGNavBar.h"

@implementation XMGNavBar

/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)globalImg {

    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"XMGNavigationController"), nil];
    [navBar setBackgroundImage:globalImg forBarMetrics:UIBarMetricsDefault];


}
/**
 *  设置全局导航栏标题颜色
 *
 *  @param globalTextColor 全局导航栏标题颜色
 */
+ (void)setGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize  {

    if (globalTextColor == nil) {
        return;
    }
    if (fontSize < 6 || fontSize > 40) {
        fontSize = 16;
    }
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"XMGNavigationController"), nil];
    // 设置导航栏颜色
    NSDictionary *titleDic = @{
                               NSForegroundColorAttributeName: globalTextColor,
                               NSFontAttributeName: [UIFont systemFontOfSize:fontSize]
                               };
    [navBar setTitleTextAttributes:titleDic];
}


@end
