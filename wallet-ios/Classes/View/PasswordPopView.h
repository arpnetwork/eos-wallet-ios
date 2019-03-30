//
//  PasswordPopView.h
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PasswordPopView;

@protocol PasswordPopViewDelegate <NSObject>
@optional
- (void)popView:(PasswordPopView *)popView didConfirm:(NSString *)password;
@end

@interface PasswordPopView : UIView
@property (nonatomic, weak) id<PasswordPopViewDelegate> delegate;
@property (nonatomic, copy) NSString *passwordTips;

- (void)showInView:(UIView *)view;
- (void)hide;
@end
