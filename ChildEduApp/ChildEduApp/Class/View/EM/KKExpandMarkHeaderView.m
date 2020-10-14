//  KKExpandMarkHeaderView.m
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
//  @class KKExpandMarkHeaderView
//  @abstract <#类的描述#>
//  @discussion <#类的功能#>
//

#import "KKExpandMarkHeaderView.h"
@interface KKExpandMarkHeaderView ()

@end

@implementation KKExpandMarkHeaderView

+(KKExpandMarkHeaderView *)instanceJackNibView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"KKExpandMarkHeaderView" owner:nil options:nil];
    return [nibView objectAtIndex:0];

}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    [self jcLayoutMyUI];
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
