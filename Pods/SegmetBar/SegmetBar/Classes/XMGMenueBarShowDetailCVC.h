//
//  XMGMenueBarShowDetailCVC.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSString+SegmentModelProtocol.h"

@interface XMGMenueBarShowDetailCVC : UICollectionViewController

@property (nonatomic, assign) CGFloat expectedHeight;

@property (nonatomic, strong) NSArray <id<XMGSegmentModelProtocol>>*items;

@end
