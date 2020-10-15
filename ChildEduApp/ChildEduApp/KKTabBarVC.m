//
//  KKTabBarVC.m
//  ChildEduApp
//
//  Created by 谢齐 on 2020/10/14.
//  Copyright © 2020 谢齐. All rights reserved.
//

#import "KKTabBarVC.h"
@interface KKTabBarVC ()

@end

@implementation KKTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *list = @[@"KKExpandMarketVC",@"KKFindVC"];
    NSArray *imgs = @[@"",@""];
    NSArray *selectImgs = @[@"",@""];
    NSArray *title = @[@"拓展",@"发现"];
    NSMutableArray *mut = [NSMutableArray array];
    
    for (NSInteger idx=0; idx < list.count; idx++) {
        UIViewController *vc = [[NSClassFromString(list[idx]) alloc]init];
        vc.title = title[idx];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImgs[idx]];
        vc.tabBarItem.image = [UIImage imageNamed:imgs[idx]];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [mut addObject:nav];
    }
    self.viewControllers = mut.copy;
}



@end
