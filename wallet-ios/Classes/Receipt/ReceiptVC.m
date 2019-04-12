//
//  ReceiptVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ReceiptVC.h"

@interface ReceiptVC ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeView;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UIButton *cpButton;

@end

@implementation ReceiptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"收款";
    [self setupViews];
}

- (void)setupViews {
    self.view.backgroundColor = BaseColor;
    self.containerView.layer.cornerRadius = 8;
    self.containerView.layer.masksToBounds = YES;
    
    self.cpButton.layer.cornerRadius = 3;
    self.cpButton.layer.masksToBounds = YES;
    
    //TODO
    self.qrcodeView.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)copyButtonClicked:(id)sender {
}

@end
