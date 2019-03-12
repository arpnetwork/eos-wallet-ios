//
//  UIImage+Util.h
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)

+ (UIImage *)imageWithName:(NSString *)imageName;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name leftCapWidth:(CGFloat)left topCapHeight:(CGFloat)top;

@end
