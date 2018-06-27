//
//  XMGRightLeftBtn.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGSegmentRightLeftBtn.h"

@interface XMGSegmentRightLeftBtn()

@property (nonatomic, assign) CGFloat radio;

@end

@implementation XMGSegmentRightLeftBtn


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

-(CGFloat)radio {
    return 0.7;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{

    return CGRectMake(0, 0, contentRect.size.width * self.radio, contentRect.size.height);

}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{

    return CGRectMake(contentRect.size.width * self.radio, 0, contentRect.size.width * ( 1 - self.radio - 0.2), contentRect.size.height);
    
}




@end

