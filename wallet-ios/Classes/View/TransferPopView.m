//
//  TransferPopView.m
//  wallet-ios
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TransferPopView.h"

@interface TransferPopView()
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@end

@implementation TransferPopView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.6];
    self.confirmButton.backgroundColor = BaseColor;
    self.confirmButton.layer.cornerRadius = 3;
    self.confirmButton.layer.masksToBounds = YES;
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)confirmButtonClicked:(id)sender {
    [self removeFromSuperview];
}

@end
