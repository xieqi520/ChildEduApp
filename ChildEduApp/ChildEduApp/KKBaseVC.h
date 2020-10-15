//
//  KKBaseVC.h
//  CourseApp
//
//  Created by aoxin1 on 2020/7/29.
//  Copyright © 2020 xieqi. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BtnBlock)(UIButton * _Nullable btn);
typedef void(^TapBlock)(UITapGestureRecognizer * _Nullable sender);
NS_ASSUME_NONNULL_BEGIN

@interface KKBaseVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,assign)BOOL firstLoad;
@property(nonatomic,strong)UITableView *syTableView;
@property(nonatomic,strong)UICollectionView *kkCollectionView;
@property(nonatomic,strong)NSMutableArray *syData;
-(void)syGetNetData;
-(void)syConfigUI;
- (instancetype)initWithSelfClassNib;

- (void)addEventObserver;

- (void)removeEventObserver;

- (void)setStatusBarTintColor:(UIColor *)color;

- (BOOL)showLeftItemBarButton;

- (void)setPopEvent;

@end

NS_ASSUME_NONNULL_END
