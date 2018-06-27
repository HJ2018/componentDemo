//
//  XMGCacheTool.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/2.
//  Copyright © 2016年 小码哥. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface XMGCacheTool : NSObject

+ (NSString *)getSizeWithPath: (NSString *)path;

+ (void)clearCacheWithPath: (NSString *)path;

@end
