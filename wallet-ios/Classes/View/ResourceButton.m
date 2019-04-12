//
//  ResourceButton.m
//  wallet-ios
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ResourceButton.h"

#define TitleWidth 22
#define TitleHeight 11
#define ImageWidth 32
#define ImageHeight 23
#define Spacing 2
#define MarginTop 11

@implementation ResourceButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = (contentRect.size.width - TitleWidth) / 2;
    CGFloat titleY = MarginTop + ImageHeight + Spacing;
    return CGRectMake(titleX, titleY, TitleWidth, TitleHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = (contentRect.size.width - ImageWidth) / 2;
    CGFloat imageY = MarginTop;
    return CGRectMake(imageX, imageY, ImageWidth, ImageHeight);
}

- (void)setSelected:(BOOL)selected {
}

- (void)setHighlighted:(BOOL)highlighted {
}

@end
