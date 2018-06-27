//
//  XMGNoticeLocal.h
//  喜马拉雅FM
//
//  Created by 弓虽_子 on 16/8/22.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGNoticeLocal : NSObject
+(UILocalNotification*)RegisterLocalNotificationWithFireDate:(NSDate *)firedate //后台运行的本地通知
                                                  repeatType:(NSCalendarUnit)repeatInterval
                                                    keepSleep:(BOOL)isKeepSleep;




+(void)cancelAllLocalNotifications;
+(void)cancelKeepSleepNotice;
+(void)cancleAlarmNotifications;

@end
