//
//  XMGDeviceMessage.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/24.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGDeviceMessage.h"
#include <sys/param.h>
#include <sys/mount.h>

@implementation XMGDeviceMessage

+ (NSString *)freeDiskSpaceInBytes {
    struct statfs buf;
    float freespace = -1;
    if(statfs("/var", &buf) >= 0){
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }

    // 处理单位
    NSArray *units = @[@"B", @"KB", @"MB", @"GB", @"TB"];
    NSInteger count = 1000;
    NSInteger index = 0;
    while (freespace > count) {
        freespace = freespace / count;
        index ++;
    }

    NSString *formatStr = [NSString stringWithFormat:@"%.1f%@", freespace, units[index]];

    return formatStr;
}

@end
