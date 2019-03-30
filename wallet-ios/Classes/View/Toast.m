//
//  Toast.m
//  wallet-ios
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "Toast.h"

#define TextFont 15

@interface Toast()

@end

@implementation Toast

- (instancetype)initWithText:(NSString *)text {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 30, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:TextFont]} context:nil];
    CGFloat toastH = 36;
    CGFloat toastW = rect.size.width + toastH + 0;
    CGFloat toastX = (SCREEN_WIDTH - toastW) / 2;
    CGFloat toastY = SCREEN_HEIGHT - 250;
    if (self = [super initWithFrame:CGRectMake(toastX, toastY, toastW, toastH)]) {
        [self setupViewsWithText:text];
    }
    return self;
}

- (void)dealloc {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)setupViewsWithText:(NSString *)text {
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.7;
    self.layer.cornerRadius = 18;
    self.layer.masksToBounds = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:TextFont];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
    [self performSelector:@selector(hide) withObject:nil afterDelay:2];
}

- (void)hide {
    [self removeFromSuperview];
}

@end
