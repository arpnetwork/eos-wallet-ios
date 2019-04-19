//
//  LancherVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/12.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "LancherVC.h"

@interface LancherVC ()
@property (weak, nonatomic) IBOutlet UILabel *eosLabel;

@end

@implementation LancherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的钱包";
    [self setupViews];
}

- (void)setupViews {
    self.eosLabel.layer.cornerRadius = 5;
    self.eosLabel.layer.masksToBounds = YES;
}

- (IBAction)hasAccountButtonClicked:(id)sender {
}

- (IBAction)hasNoAccountButtonClicked:(id)sender {
}

@end
