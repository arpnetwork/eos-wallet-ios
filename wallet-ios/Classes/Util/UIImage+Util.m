//
//  UIImage+Util.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)

+ (UIImage *)imageWithName:(NSString *)imageName {
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], imageName];
    return [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)resizedImageWithName:(NSString *)name {
    return [self resizedImageWithName:name leftCapWidth:0.5 topCapHeight:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name leftCapWidth:(CGFloat)left topCapHeight:(CGFloat)top {
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return scaledImage;
}

@end
