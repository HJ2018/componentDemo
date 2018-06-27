//
//  XMGDeviceMessage.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/24.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGDeviceMessage : NSObject

/**
 *  设备剩余存储空间
 *
 *  @return 剩余存储空间
 */
+ (NSString *)freeDiskSpaceInBytes;

@end
