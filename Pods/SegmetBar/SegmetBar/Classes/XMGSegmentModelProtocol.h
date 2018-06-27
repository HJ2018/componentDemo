//
//  XMGSegmentModelProtocol.h
//  控件封装
//
//  Created by 王顺子 on 16/9/7.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#pragma mark - 模型必须遵循的协议

@protocol XMGSegmentModelProtocol <NSObject>

/** 选项卡的ID, 如果不设置, 默认是索引值(从0开始) */
@property (nonatomic, assign, readonly) NSInteger segID;

/** 选项卡内容 */
@property (nonatomic, copy, readonly) NSString *segContent;

@end
