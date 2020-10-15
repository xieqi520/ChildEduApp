//
//  KKHorizontalCollectView.m
//  ChildEduApp
//
//  Created by xintu on 2020/10/15.
//  Copyright © 2020 谢齐. All rights reserved.
//

#import "KKHorizontalCollectView.h"
@interface KKHorizontalCollectView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray *syData;
@end

@implementation KKHorizontalCollectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (UICollectionView *)kkCollectionView{
    if (!_kkCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(100, 100);
        _kkCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _kkCollectionView.delegate = self;
        _kkCollectionView.dataSource = self;
    }
    return _kkCollectionView;
}
- (void)setItemSize:(CGSize)itemSize{
    _itemSize = itemSize;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.kkCollectionView.collectionViewLayout;
    layout.itemSize = itemSize;
    [self.kkCollectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)setDataSources:(NSArray *)dataSources{
    _dataSources = dataSources;
    [self.kkCollectionView reloadData];
}

-(NSMutableArray*)syData{
    if (!_syData) {
        _syData = [NSMutableArray array];
    }
    return _syData;
}
@end
