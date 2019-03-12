//
//  UIColor+Util.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0xFF)) / 255.0 alpha:alpha];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end
