//
//  KKHorizontalCollectView.h
//  ChildEduApp
//
//  Created by xintu on 2020/10/15.
//  Copyright © 2020 谢齐. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKHorizontalCollectView : UIView
@property(nonatomic,assign)CGSize itemSize;
@property(nonatomic,strong)UICollectionView *kkCollectionView;
@property(nonatomic,assign)NSInteger type;//
@property(nonatomic,copy)NSArray *dataSources;
@end

NS_ASSUME_NONNULL_END
