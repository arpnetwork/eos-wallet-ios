//
//  AssetsTypePopView.h
//  wallet-ios
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AssetsTypePopViewDelegate <NSObject>
@optional
- (void)didSelectAssetsTypeItem:(NSInteger)index;
@end

@interface AssetsTypePopView : UIView
@property (nonatomic, weak) id<AssetsTypePopViewDelegate> delegate;

- (instancetype)initWithArray:(NSArray *)array;
- (void)showInView:(UIView *)parent;
- (void)hide;
@end
