//
//  AssetsTypePopView.m
//  wallet-ios
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "AssetsTypePopView.h"

@interface AssetsTypePopView()
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, weak) UIView *container;
@end

@implementation AssetsTypePopView

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)]) {
        self.array = array;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.6];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self addGestureRecognizer:tapGesture];
    
    CGFloat margin = 40;
    CGFloat itemH = 45;
    
    CGFloat containerW = self.frame.size.width - margin * 2;
    CGFloat containerH = itemH * [self.array count];
    CGFloat containerY = (self.frame.size.height - containerH - NavBarHeight) * 0.5;
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(margin, containerY, containerW, containerH)];
    container.backgroundColor = [UIColor whiteColor];
    container.layer.cornerRadius = 5;
    container.layer.masksToBounds = YES;
    [self addSubview:container];
    self.container = container;
    
    for (int i = 0; i < [self.array count]; i++) {
        NSString *content = [self.array objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = i;
        button.frame = CGRectMake(0, itemH * i, containerW, itemH);
        [button setTitle:content forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:button];
    }
}

- (void)showInView:(UIView *)parent {
    [parent addSubview:self];
}

- (void)hide {
    [self removeFromSuperview];
}

- (void)viewTapped:(UITapGestureRecognizer *)gesture {
    [self hide];
}

- (void)buttonClicked:(UIButton *)button {
    [self hide];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectAssetsTypeItem:)]) {
        [self.delegate didSelectAssetsTypeItem:button.tag];
    }
}

@end
