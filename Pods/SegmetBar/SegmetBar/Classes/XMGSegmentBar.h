//
//  XMGSegmentBar.h
//  控件封装
//
//  Created by 王顺子 on 16/9/7.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGSegmentConfig.h"
#import "NSString+SegmentModelProtocol.h"



@protocol XMGSegmentBarDelegate <NSObject>
/**
 *  选项卡 从某个索引 选中某个索引
 *
 *  @param toIndex   选中的索引
 *  @param fromIndex 从某个索引
 */
- (void)segmentBarDidSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;

@end


@interface XMGSegmentBar : UIView

/**
 *  快速根据配置参数, 创建选项卡
 *
 *  @param config 选项卡配置模型
 *
 *  @return 选项卡
 */
+ (instancetype)segmentBarWithConfig: (XMGSegmentConfig *)config;

/** 根据配置, 更新视图 */
- (void)updateViewWithConfig: (void(^)(XMGSegmentConfig *config))configBlock;

/** 选项卡模型数组, 此处传递字符串数组也可以, 只不过索引变成了对应的数组下标 */
@property (nonatomic, strong) NSArray <id<XMGSegmentModelProtocol>>*segmentMs;

/** 选项卡代理 */
@property (nonatomic, weak) id<XMGSegmentBarDelegate> delegate;

/** 供外界反向赋值, 赋值后, 视图会自动更新, 传递的值, 是选项卡的segID(如果没有设置, 则传递索引) */
@property (nonatomic, assign) NSInteger selectedIndex;

@end


