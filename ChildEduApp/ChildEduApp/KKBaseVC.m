//
//  KKBaseVC.m
//  CourseApp
//
//  Created by aoxin1 on 2020/7/29.
//  Copyright © 2020 xieqi. All rights reserved.
//

#import "KKBaseVC.h"

@interface KKBaseVC ()

@end

@implementation KKBaseVC
- (UICollectionView *)kkCollectionView{
    if (!_kkCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        CGFloat with = (kScreenWidth - 40) / 2;
        CGFloat h = with + 40;
        layout.itemSize = CGSizeMake(with, h);
        _kkCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _kkCollectionView.delegate = self;
        _kkCollectionView.dataSource = self;
        _kkCollectionView.backgroundColor = [UIColor hex:@"#F8FAFC"];
    
    }
    return _kkCollectionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

-(NSMutableArray*)syData{
    if (!_syData) {
        _syData = [NSMutableArray array];
    }
    return _syData;
}
-(void)syConfigUI{}
-(void)syGetNetData{}
- (UITableView *)syTableView{
    if (!_syTableView) {
        _syTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _syTableView.delegate = self;
        _syTableView.dataSource = self;
        _syTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _syTableView.backgroundColor = [UIColor hex:@"#F8FAFC"];
    }
    return _syTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addEventObserver];
    [self createGoBackItem];
}

#pragma mark - Public
- (instancetype)initWithSelfClassNib {
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (BOOL)showLeftItemBarButton {return NO;}

- (void)addEventObserver {}

- (void)removeEventObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPopEvent {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setStatusBarTintColor:(UIColor *)color {
    if ([self.statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        self.statusBar.backgroundColor = color;
    }
}

#pragma mark - private
- (UIView *)statusBar {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    return statusBar;
}


- (UIColor *)navigationBarBarTintColor {
    return [UIColor whiteColor];
}

- (void)dealloc {
    [self removeEventObserver];
}

#pragma mark - UI
- (void)createGoBackItem {
    if (@available(iOS 11.0, *)) {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:UIScrollView.class]) {
                [(UIScrollView *)view setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
            }
        }
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.navigationController.viewControllers.count > 1 || [self showLeftItemBarButton]) {
        UIImage *backImage = [[UIImage imageNamed:@"backItemImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:backImage style:UIBarButtonItemStyleDone target:self action:@selector(setPopEvent)];
    }
}

@end
