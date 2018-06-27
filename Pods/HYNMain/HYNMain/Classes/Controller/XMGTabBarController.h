//
//  XMGTabBarController.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/1.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGTabBarController : UITabBarController


/**
 获取单例对象

 @return TabBarController
 */
+ (instancetype)shareInstance;


/**
 添加子控制器的block

 @param addVCBlock 添加代码块

 @return TabBarController
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(XMGTabBarController *tabBarC))addVCBlock;


/**
 添加子控制器

 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

@end
