//
//  TransactionDetailVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TransactionDetailVC.h"

@interface TransactionDetailVC ()
@property (weak, nonatomic) IBOutlet UIButton *senderButton;
@property (weak, nonatomic) IBOutlet UIButton *receiverButton;
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;
@property (weak, nonatomic) IBOutlet UIButton *transNumButton;
@property (weak, nonatomic) IBOutlet UILabel *blockNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *senderWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *receiverWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *memoWidthConstraint;

@end

@implementation TransactionDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易详情";
}

- (IBAction)senderButtonClicked:(id)sender {
}

- (IBAction)receiverButtonClicked:(id)sender {
}

- (IBAction)transNumButtonClicked:(id)sender {
}

@end
