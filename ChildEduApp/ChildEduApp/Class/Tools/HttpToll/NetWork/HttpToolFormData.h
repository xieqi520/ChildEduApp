//
//  HttpToolFormData.h
//  PregnantDoctor
//
//  Created by aoxin1 on 2019/11/1.
//  Copyright © 2019 RXG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpToolFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名 必须加后缀
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;
- (instancetype)initWithName:(NSString *)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType;
+ (HttpToolFormData*)createName:(NSString *)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType;
@end

NS_ASSUME_NONNULL_END
