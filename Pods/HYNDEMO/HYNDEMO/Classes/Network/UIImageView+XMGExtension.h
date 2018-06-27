//
//  UIImageView+XMGExtension.h
//  百思不得姐
//
//  Created by 王顺子 on 16/6/16.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+XMGImage.h"

@interface UIImageView (XMGExtension)

- (void)setURLImageWithURL: (NSURL *)url progress:(void(^)(CGFloat progress))progress complete: (void(^)(void))complete;

- (void)setURLImageWithURL: (NSURL *)url placeHoldImage:(UIImage *)placeHoldImage isCircle:(BOOL)isCircle;

@end

