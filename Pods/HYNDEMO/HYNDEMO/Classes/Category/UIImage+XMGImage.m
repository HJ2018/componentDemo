//
//  UIImage+XMGImage.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/1.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIImage+XMGImage.h"

@implementation UIImage (XMGImage)

+ (UIImage *)originImageWithName: (NSString *)name {

    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

- (UIImage *)circleImage {

    CGSize size = self.size;
    CGFloat drawWH = size.width < size.height ? size.width : size.height;


    // 1. 开启图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(drawWH, drawWH));
    // 2. 绘制一个圆形区域, 进行裁剪
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect clipRect = CGRectMake(0, 0, drawWH, drawWH);
    CGContextAddEllipseInRect(context, clipRect);
    CGContextClip(context);

    // 3. 绘制大图片
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:drawRect];

    // 4. 取出结果图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();

    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;

}

@end
