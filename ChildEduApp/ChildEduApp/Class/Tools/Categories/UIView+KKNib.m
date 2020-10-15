//
//  UIView+KKNib.m
//  ChildEduApp
//
//  Created by xintu on 2020/10/15.
//  Copyright © 2020 谢齐. All rights reserved.
//

#import "UIView+KKNib.h"

@implementation UIView (KKNib)
+(UINib*)kk_nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
+(NSString*)identify{
    return [NSString stringWithFormat:@"kk_%@",NSStringFromClass([self class])];
}
@end
