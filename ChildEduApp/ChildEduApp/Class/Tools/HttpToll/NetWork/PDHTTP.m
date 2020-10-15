//
//  PDHTTP.m
//  PDEleScale
//
//  Created by ios on 2018/4/3.
//  Copyright © 2018年 saiyi. All rights reserved.
//

#import "PDHTTP.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "HttpToolFormData.h"
#import "AppUrls.h"

@implementation PDHTTP

+ (void) httpType:(kHttpType)type URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result {

    [SVProgressHUD dismiss];
    if (hud) {
        [SVProgressHUD show];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSArray *responseFilters = @[];
    
    if ([responseFilters containsObject:url]) {
        AFHTTPResponseSerializer *response = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = response;
    }else{
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;//去除空值
        manager.responseSerializer = response;
    }
    
    NSArray *requestFilters = @[];
    if ([requestFilters containsObject:url]) {
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else{
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
   
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    NSDictionary *paramDict = para;
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id response){
        
         
       
        if ([paramDict.allKeys containsObject:@"fileBase"]) {
            SLog(@"%@---%@",url,response);
        }else{
            SLog(@"%@---%@---%@",url,para,response);
        }
        
         [SVProgressHUD dismiss];
        
        if ([response isKindOfClass:[NSArray class]]) {
            result(response,kResultType_Array,nil);
        }else if([response isKindOfClass:[NSData class]]){
            NSString *str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
            result(str,kResultType_String,nil);
        }else if ([response isKindOfClass:[NSDictionary class]]){
            result(response,kResultType_Dict,nil);
        }
      
    };
    
    void (^failureBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        SLog(@"%@---%@---%@",url,para,error);
        if (error) {
            if ([paramDict.allKeys containsObject:@"fileBase"]) {
                SLog(@"%@---%@",url,error);
                }else{
                SLog(@"%@---%@---%@",url,para,error);
            }
        }
        
        if (hud) {
            [SVProgressHUD showErrorWithStatus:@"网络开小差了呢"];
            [SVProgressHUD dismissWithDelay:2 completion:^{
                result(nil, kResultType_Other, error);
            }];
        }
    };
 
    
   
    if (![url containsString:@"http://"]) {
        url = [NSString stringWithFormat:@"%@/%@", kBaseURL, url];
    }
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    switch (type) {
        case kHttpType_POST:
        {
            [manager POST:url parameters:para progress:nil success:successBlock failure:failureBlock];
        }
            break;
        case kHttpType_GET:
        {
            [manager GET:url parameters:para progress:nil success:successBlock failure:failureBlock];
        }
            break;
        case kHttpType_PUT:
        {
            [manager PUT:url parameters:para success:successBlock failure:failureBlock];
            
        }
            break;
        case kHttpType_DELETE:
        {
            [manager DELETE:url parameters:para success:successBlock failure:failureBlock];
        }
            break;
        default:
            break;
    }
    
}

+ (void)httpUploadImage:(UIImage *)image URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result {
    [SVProgressHUD dismiss];
    if (hud) {
        [SVProgressHUD show];
        [SVProgressHUD showWithStatus:@"图片上传中"];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id response){
        [SVProgressHUD dismiss];
        if ([response isKindOfClass:[NSArray class]]) {
            result(response,kResultType_Array,nil);
        }else if([response isKindOfClass:[NSData class]]){
            NSString *str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
            result(str,kResultType_String,nil);
        }else if ([response isKindOfClass:[NSDictionary class]]){
            result(response,kResultType_Dict,nil);
        }
    };
    
    void (^failureBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        if (hud) {
            [SVProgressHUD showErrorWithStatus:@"网络开小差了呢"];
            [SVProgressHUD dismissWithDelay:2 completion:^{
                result(nil, kResultType_Other, error);
            }];
        }
    };
   
   if (![url containsString:@"http://"]) {
          url = [NSString stringWithFormat:@"%@/%@", kBaseURL, url];
    }
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [manager POST:url parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) { 
        [formData appendPartWithFileData:data name:@"file" fileName:@"name.png" mimeType:@"image/jpeg"];
    } progress:nil success:successBlock failure:failureBlock];
}



+ (void)httpUploadFiles:(NSArray*)formDataArray URLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result {
    [SVProgressHUD dismiss];
    if (hud) {
        [SVProgressHUD show];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSArray *responseFilters = @[];
    
    if ([responseFilters containsObject:url]) {
        AFHTTPResponseSerializer *response = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = response;
    }else{
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;//去除空值
        manager.responseSerializer = response;
    }
    
    NSArray *requestFilters = @[];
    if ([requestFilters containsObject:url]) {
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else{
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    
    void (^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id response){
        [SVProgressHUD dismiss];
        if ([response isKindOfClass:[NSArray class]]) {
            result(response,kResultType_Array,nil);
        }else if([response isKindOfClass:[NSData class]]){
            NSString *str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
            result(str,kResultType_String,nil);
        }else if ([response isKindOfClass:[NSDictionary class]]){
            result(response,kResultType_Dict,nil);
        }
       SLog(@"%@/%@---%@--%@",kBaseURL,url,para,response);
    };
    
    void (^failureBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        SLog(@"%@/%@---%@--%@",kBaseURL,url,para,error);
        [SVProgressHUD dismiss];
        if (hud) {
            [SVProgressHUD showErrorWithStatus:@"网络开小差了呢"];
            [SVProgressHUD dismissWithDelay:2 completion:^{
                result(nil, kResultType_Other, error);
            }];
        }
    };
    
    if (![url containsString:@"http://"]) {
        url = [NSString stringWithFormat:@"%@/%@", kBaseURL, url];
    }
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [manager POST:url parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (HttpToolFormData *httpToolFormData in formDataArray) {
            [formData appendPartWithFileData:httpToolFormData.data name:httpToolFormData.name fileName:httpToolFormData.fileName mimeType:httpToolFormData.mimeType];
        }
    } progress:nil success:successBlock failure:failureBlock];
}



+ (void)httpDownloadFileByURLString:(NSString *)url parameters:(id)para progressHUD:(BOOL)hud result:(void(^)(id response, kResultType type, NSError *error))result {
    [SVProgressHUD dismiss];
    if (hud) {
        [SVProgressHUD show];
    }
    
    if (![url containsString:@"http://"]) {
        url = [NSString stringWithFormat:@"%@/%@", kBaseURL, url];
    }
    
    
    url= [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //创建传话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //下载文件
    /*
     第一个参数:请求对象
     第二个参数:progress 进度回调
     第三个参数:destination 回调(目标位置)
     有返回值
     targetPath:临时文件路径
     response:响应头信息
     第四个参数:completionHandler 下载完成后的回调
     filePath:最终的文件路径
     */
    /* 开始请求下载 */
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = @"";
        if (![fileManager fileExistsAtPath:filePath]) {
            [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *fileFullPath = [filePath stringByAppendingPathComponent:[response suggestedFilename]];
        NSURL *documentDirectoryURL = [NSURL fileURLWithPath:fileFullPath];
        NSError *error = nil;
        [fileManager removeItemAtURL:documentDirectoryURL error:&error];
        return documentDirectoryURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        SLog(@"File downloaded to: %@--%@", filePath,error);
        [SVProgressHUD dismiss];
        if (error != nil && (error.code < 200 || error.code > 300)) {
            if (hud) {
                [SVProgressHUD showErrorWithStatus:@"网络开小差了呢"];
                [SVProgressHUD dismissWithDelay:2 completion:^{
                    result(nil,kResultType_Other,error);
                }];
            }else{
                result(nil,kResultType_Other,error);
            }
        } else {
            result(filePath.path,kResultType_String,nil);
            if (hud) {
                [SVProgressHUD showSuccessWithStatus:@"下载完成"];
            }
            
        }
    }];
    //重新开始下载
    [downloadTask resume];
}

@end
