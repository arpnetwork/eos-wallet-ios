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
@property (weak, nonatomic) IBOutlet UILabel *senderLabel;
@property (weak, nonatomic) IBOutlet UILabel *receiverLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;
@end

@implementation TransferPopView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.6];
    self.confirmButton.backgroundColor = BaseColor;
    self.confirmButton.layer.cornerRadius = 3;
    self.confirmButton.layer.masksToBounds = YES;
}

- (void)setSender:(NSString *)sender {
    _sender = sender;
    [self.senderLabel setText:sender];
}

- (void)setReceiver:(NSString *)receiver {
    _receiver = receiver;
    [self.receiverLabel setText:receiver];
}

- (void)setMemo:(NSString *)memo {
    _memo = memo;
    [self.memoLabel setText:memo];
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
}

- (void)hide {
    [self removeFromSuperview];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self hide];
}

- (IBAction)confirmButtonClicked:(id)sender {
    [self hide];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickTransferConfirmButton:)]) {
        [self.delegate didClickTransferConfirmButton:self];
    }
}

@end
