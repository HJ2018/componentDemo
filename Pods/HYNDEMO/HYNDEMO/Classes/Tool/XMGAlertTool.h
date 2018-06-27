//
//  XMGAlertTool.h
//  喜马拉雅FM
//
//  Created by 弓虽_子 on 16/8/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMGAlertTool : NSObject


+ (void)alertTitle:(NSString *)titile type:(UIAlertControllerStyle)alertType message:(NSString *)message didTask:(void(^)(void))task;

@end
