//
//  PasswordPopView.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "PasswordPopView.h"

@interface PasswordPopView()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *passwordTipsLabel;

@end

@implementation PasswordPopView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.6];
    self.containerView.layer.cornerRadius = 5;
    self.containerView.layer.masksToBounds = YES;
}

- (void)setPasswordTips:(NSString *)passwordTips {
    _passwordTips = passwordTips;
    if (passwordTips != nil && passwordTips.length > 0) {
        [self.passwordTipsLabel setText:[NSString stringWithFormat:@"密码提示：%@", passwordTips]];
    } else {
        self.passwordTipsLabel.hidden = YES;
    }
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
}

- (void)hide {
    [self removeFromSuperview];
}

- (IBAction)cancelButtonClicked:(id)sender {
    [self hide];
}

- (IBAction)confirmButtonClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(popView:didConfirm:)]) {
        [self.delegate popView:self didConfirm:TRIMSTR(self.passwordTextField.text)];
    }
}

@end
