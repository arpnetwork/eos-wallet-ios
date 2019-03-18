//
//  ReceiptTransferButton.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ReceiptTransferButton.h"

#define TitleWidth 32
#define TitleHeight 16
#define ImageWidth 20
#define ImageHeight 20
#define Spacing 15

@implementation ReceiptTransferButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor colorWithHex:0x5a5b5c] forState:UIControlStateNormal];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = (contentRect.size.width - ImageWidth - Spacing - TitleWidth) / 2 + ImageWidth + Spacing;
    CGFloat titleY = (contentRect.size.height - TitleHeight) / 2;
    return CGRectMake(titleX, titleY, TitleWidth, TitleHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = (contentRect.size.width - ImageWidth - Spacing - TitleWidth) / 2;
    CGFloat imageY = (contentRect.size.height - ImageHeight) / 2;
    return CGRectMake(imageX, imageY, ImageWidth, ImageHeight);
}

- (void)setSelected:(BOOL)selected {
}

- (void)setHighlighted:(BOOL)highlighted {
}

@end
