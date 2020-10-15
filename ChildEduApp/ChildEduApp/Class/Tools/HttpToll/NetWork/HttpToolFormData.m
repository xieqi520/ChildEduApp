//
//  HttpToolFormData.m
//  PregnantDoctor
//
//  Created by aoxin1 on 2019/11/1.
//  Copyright © 2019 RXG. All rights reserved.
//

#import "HttpToolFormData.h"

@implementation HttpToolFormData
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"file";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        self.fileName = [NSString stringWithFormat:@"%@.png", str];
        self.mimeType = @"png";
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType
{
    self = [super init];
    if (self) {
        self.name = name;
        self.fileName = fileName;
        self.data = data;
        self.mimeType = mimeType;
    }
    return self;
}
+ (HttpToolFormData*)createName:(NSString *)name fileName:(NSString*)fileName data:(NSData*)data mimeType:(NSString*)mimeType
{
    HttpToolFormData *httpTool = [[HttpToolFormData alloc]initWithName:name fileName:fileName data:data mimeType:mimeType];
    return httpTool;;
}

@end

