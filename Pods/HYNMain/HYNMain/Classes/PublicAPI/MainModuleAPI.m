//
//  MainModuleAPI.m
//  主要骨架
//
//  Created by 王顺子 on 16/10/19.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "MainModuleAPI.h"
#import "XMGTabBar.h"
#import "XMGTabBarController.h"
#import "XMGNavBar.h"
#import "XMGMiddleView.h"

@implementation MainModuleAPI

+ (XMGTabBarController *)rootTabBarCcontroller {
    return [XMGTabBarController shareInstance];
}


+ (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {

    [[XMGTabBarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];

}


+ (void)setTabbarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock {

    XMGTabBar *tabbar = (XMGTabBar *)[XMGTabBarController shareInstance].tabBar;
    tabbar.middleClickBlock = middleClickBlock;

}

/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setNavBarGlobalBackGroundImage: (UIImage *)globalImg {
    [XMGNavBar setGlobalBackGroundImage:globalImg];
}
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {

    [XMGNavBar setGlobalTextColor:globalTextColor andFontSize:fontSize];

}

+ (UIView *)middleView {
    return [XMGMiddleView middleView];
}


@end
