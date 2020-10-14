//
//  AppDelegate.m
//  ChildEduApp
//
//  Created by 谢齐 on 2020/10/14.
//  Copyright © 2020 谢齐. All rights reserved.
//

#import "AppDelegate.h"
#import "KKTabBarVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
     self.window.rootViewController = [[KKTabBarVC alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}






@end
