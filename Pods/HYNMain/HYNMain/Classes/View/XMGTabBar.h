//
//  XMGTbabBar.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/1.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGTabBar : UITabBar

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);


@end
