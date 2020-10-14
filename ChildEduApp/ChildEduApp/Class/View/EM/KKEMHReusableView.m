//  KKEMHReusableView.m
//  ChildEduApp
/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 *
 * ━━━━━━感觉萌萌哒━━━━━━
 */
//  Created by 谢齐 on 2020/10/14.
//  Copyright © 2020 谢齐. All rights reserved.杰克
//  @class KKEMHReusableView
//  @abstract <#类的描述#>
//  @discussion <#类的功能#>
//


#import "KKEMHReusableView.h"

@interface KKEMHReusableView ()

@end

@implementation KKEMHReusableView
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    [self jcLayoutMyUI];
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self jcLayoutMyUI];
    return self;
}
#pragma mark - 布局UI
- (void)jcLayoutMyUI
{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
