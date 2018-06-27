//
//  XMGAlertTool.m
//  喜马拉雅FM
//
//  Created by 弓虽_子 on 16/8/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGAlertTool.h"


@implementation XMGAlertTool


+ (void)alertTitle:(NSString *)titile type:(UIAlertControllerStyle)alertType message:(NSString *)message didTask:(void(^)(void))task {
    
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:titile message:message preferredStyle:alertType];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (task) {
            task();
        }
    }];
    
    [alertVC addAction:action];
    [alertVC addAction:action1];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
}


@end
