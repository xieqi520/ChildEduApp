//
//  AppMacro.h
//  CourseApp
//
//  Created by aoxin1 on 2020/7/29.
//  Copyright © 2020 xieqi. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#endif


#define NavigationBar_HEIGHT_iphone_x       88
#define NavigationBar_HEIGHT_iOS7_Later     64
#define NAVIBAR_HEIGHT   (IS_IPhoneX_All ? 88 : 64)
#define NavigationBar_HEIGHT 44     //导航栏高度
#define StatusBar_HEIGHT 20         //状态栏高度
#define TABBAR_HEIGHT  49
#define kCommonPadding 20         //间距
#define BottomHeight (KIsiPhoneX ? 34 : 0)

#define WEAK_SELF           __weak __typeof(self) weakSelf = self
#define STRONG_SELF         __strong __typeof(self) strongSelf = weakSelf

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#define kNoNavContantHeight(h) (kScreenHeight - h)
#define kNavContantHeight(h) (kScreenHeight - h - kTabBarHeight - kTopHeight)




#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"[fileName:%@]  \n [fuction: %s]," "[lineNum:%d] \n" fmt) ,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); //带函数名和行数
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define NSLog(...)
#define SLog(format, ...)
#endif

//GCD - 一次线程上运行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock)

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock)

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlock)


#define KSIMAGE(x) [UIImage imageNamed:x]

#define kRedOne [UIColor hex:@"#FF5E48"]
#define kGreyOne [UIColor hex:@"#999999"]

//
#define kToken @"kk_token"
#define kPhone @"kk_phone"
#define kUserInfo @"kk_user_info"
#define kUserID @"kk_user_id"

#define kWxNotifaction @"kk_WxNotifaction"
#define kAliNotifaction @"kk_AliNotifaction"


#define kKefuUrl @"https://cschat-ccs.aliyun.com/index.htm?tntInstId=_1zbkJHs&scene=SCE00007926#/"
#endif /* AppMacro_h */
