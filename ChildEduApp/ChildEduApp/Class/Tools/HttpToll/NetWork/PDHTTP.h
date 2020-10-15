//
//  PDHTTP.h
//  PDEleScale
//
//  Created by ios on 2018/4/3.
//  Copyright © 2018年 saiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, kHttpType) {
    kHttpType_POST,
    kHttpType_GET,
    kHttpType_PUT,
    kHttpType_DELETE
};

typedef NS_ENUM(NSInteger,kResultType){
    kResultType_String,
    kResultType_Data,
    kResultType_Dict,
    kResultType_Array,
    kResultType_Other
};
@interface PDHTTP : NSObject

+ (void)httpType:(kHttpType)type URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result;

+ (void)httpUploadImage:(UIImage *)image URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result;

//
+ (void)httpUploadFiles:(NSArray*)formDataArray URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result;
+ (void)httpDownloadFileByURLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result;
@end
