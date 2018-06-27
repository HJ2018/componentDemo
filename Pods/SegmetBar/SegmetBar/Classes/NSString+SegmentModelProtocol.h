//
//  NSString+SegmentModelProtocol.h
//  控件封装
//
//  Created by 王顺子 on 16/9/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMGSegmentModelProtocol.h"

@interface NSString(SegmentModelProtocol) <XMGSegmentModelProtocol>

/** 选项卡的ID, 如果不设置, 默认是索引值(从0开始) */
- (NSInteger)segID;

/** 选项卡内容 */
- (NSString *)segContent;



@end
