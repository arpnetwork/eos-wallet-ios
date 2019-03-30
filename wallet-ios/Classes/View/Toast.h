//
//  Toast.h
//  wallet-ios
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Toast : UIView
- (instancetype)initWithText:(NSString *)text;
- (void)showInView:(UIView *)view;
@end
