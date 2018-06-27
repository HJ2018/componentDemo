//
//  XMGMenueBarShowDetailCVC.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGMenueBarShowDetailCVC.h"
#import "XMGMenueCell.h"
#import "UIView+XMGLayout.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kRowCount 3
#define kMargin 6
#define kCellH 30

@interface XMGMenueBarShowDetailCVC ()

@end

@implementation XMGMenueBarShowDetailCVC

static NSString * const reuseIdentifier = @"menue";

-(void)setItems:(NSArray<id<XMGSegmentModelProtocol>> *)items
{

    _items = items;

    NSInteger rows = (_items.count + (kRowCount - 1)) / kRowCount;
    CGFloat height = rows * (kCellH + kMargin);
    self.collectionView.height = height;
    self.expectedHeight = height;
    [self.collectionView reloadData];
}


-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (kScreenWidth - kMargin * (kRowCount + 1)) / kRowCount;
    CGFloat height = kCellH;
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.minimumLineSpacing = kMargin;
    flowLayout.minimumInteritemSpacing = kMargin;

    return [super initWithCollectionViewLayout:flowLayout];

}
-(instancetype)init
{
    return [self initWithCollectionViewLayout:[UICollectionViewLayout new]];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:@"XMGMenueCell" bundle:currentBundle];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];

}



#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    XMGMenueCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.menueLabel.text = (NSString *)self.items[indexPath.row];
    
    return cell;
}



@end
