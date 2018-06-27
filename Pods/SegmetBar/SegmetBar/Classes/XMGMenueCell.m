//
//  XMGMenueCell.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGMenueCell.h"



@implementation XMGMenueCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];

    if (selected) {
        self.backgroundColor = [UIColor redColor];
    }else {
        self.backgroundColor = [UIColor colorWithRed:160 / 255.0 green:160 / 255.0 blue:160 / 255.0 alpha:0.4];
    }


}

@end
