//
//  BaseVC.h
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Toast.h"

@interface BaseVC : UIViewController
- (void)setupBackButton;

- (void)showLoading;
- (void)hideLoading;
- (void)showToast:(NSString *)text;
@end
