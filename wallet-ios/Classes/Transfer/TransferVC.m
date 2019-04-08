//
//  TransferVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TransferVC.h"

#import "WTextView.h"
#import "AssetsTypePopView.h"
#import "TransferPopView.h"
#import "Toast.h"
#import "PasswordPopView.h"

#define ASSETS_TYPE_ARRAY @[@"EOS", @"BHKD"]

@interface TransferVC () <WTextViewDelegate, AssetsTypePopViewDelegate, TransferPopViewDelegate, PasswordPopViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UILabel *availableBalanceLabel;
@property (weak, nonatomic) IBOutlet UIButton *assetsTypeButton;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet WTextView *memoTextView;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *memoHConstraint;

@property (nonatomic, assign) CGFloat containerH;
@property (nonatomic, assign) CGFloat memoH;

@property (nonatomic, assign) double eosBalance;
@property (nonatomic, assign) double bhkdBalance;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *assetsType;
@end

@implementation TransferVC

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.eosBalance = ((NSNumber *)[dict valueForKey:@"EOS_BALANCE"]).doubleValue;
        self.eosBalance = self.eosBalance > -1 ? self.eosBalance : 0;
        self.bhkdBalance = ((NSNumber *)[dict valueForKey:@"BHKD_BALANCE"]).doubleValue;
        self.bhkdBalance = self.bhkdBalance > -1 ? self.bhkdBalance : 0;
        self.account = [dict valueForKey:@"ACCOUNT"];
        id obj = [dict valueForKey:@"ASSETS_TYPE"];
        self.assetsType = obj != nil ? obj : @"EOS";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"转账";
    [self setupViews];
}

- (void)setupViews {
    self.memoTextView.placeholder = @"MEMO";
    self.memoTextView.placeholderColor = [UIColor colorWithHex:0xcccccc];
    self.memoTextView.wdelegate = self;
    
    self.confirmButton.backgroundColor = BaseColor;
    self.confirmButton.layer.cornerRadius = 3;
    self.confirmButton.layer.masksToBounds = YES;
    
    self.containerH = self.containerHConstraint.constant;
    self.memoH = self.memoHConstraint.constant;
    
    [self updateAvailableBalance];
    [self.assetsTypeButton setTitle:self.assetsType forState:UIControlStateNormal];
}

- (BOOL)check:(NSString *)receiver amount:(NSString *)amount {
    if (ISEMPTY(receiver)) {
        [self showToast:@"请输入账号或长按粘贴地址"];
        return NO;
    }
    if (ISEMPTY(amount)) {
        [self showToast:@"请输入金额"];
        return NO;
    }
    double dAmount = amount.doubleValue;
    BOOL isEOS = [@"EOS" isEqualToString:self.assetsType];
    if ((isEOS && dAmount > self.eosBalance) || (!isEOS && dAmount > self.bhkdBalance)) {
        [self showToast:@"余额不足，请重新输入"];
        return NO;
    }
    return YES;
}

- (void)updateAvailableBalance {
    double balance = [@"EOS" isEqualToString:self.assetsType] ? self.eosBalance : self.bhkdBalance;
    [self.availableBalanceLabel setText:[NSString stringWithFormat:@"可用 %.4f %@", balance, self.assetsType]];
}

- (IBAction)scanButtonClicked:(id)sender {
}

- (IBAction)assetsTypeClicked:(id)sender {
    AssetsTypePopView *popView = [[AssetsTypePopView alloc] initWithArray:ASSETS_TYPE_ARRAY];
    popView.delegate = self;
    [popView showInView:self.view];
}

- (IBAction)allButtonClicked:(id)sender {
    double balance = [@"EOS" isEqualToString:self.assetsType] ? self.eosBalance : self.bhkdBalance;
    [self.amountTextField setText:[NSString stringWithFormat:@"%.4f", balance]];
}

- (IBAction)confirmButtonClicked:(id)sender {
    NSString *receiver = TRIMSTR(self.accountTextField.text);
    NSString *amount = TRIMSTR(self.amountTextField.text);
    NSString *memo = TRIMSTR(self.memoTextView.text);
    if ([self check:receiver amount:amount]) {
        TransferPopView *popView = [[[NSBundle mainBundle] loadNibNamed:@"TransferPopView" owner:self options:nil] lastObject];
        popView.frame = self.view.bounds;
        popView.delegate = self;
        [popView setSender:self.account];
        [popView setReceiver:receiver];
        [popView setMemo:memo];
        [popView showInView:self.view];
    }
}

#pragma mark - AssetsTypePopViewDelegate

- (void)didSelectAssetsTypeItem:(NSInteger)index {
    NSString *assetsType = [ASSETS_TYPE_ARRAY objectAtIndex:index];
    if (![assetsType isEqualToString:self.assetsType]) {
        self.assetsType = assetsType;
        [self updateAvailableBalance];
        [self.assetsTypeButton setTitle:self.assetsType forState:UIControlStateNormal];
        [self.amountTextField setText:@""];
    }
}

#pragma mark - WTextViewDelegate

- (void)layoutChanged:(CGFloat)height {
    if (self.memoHConstraint.constant != height) {
        self.memoHConstraint.constant = height;
        self.containerHConstraint.constant = self.containerH + (height - self.memoH);
    }
}

#pragma mark - TransferPopViewDelegate

- (void)didClickTransferConfirmButton:(TransferPopView *)popView {
    PasswordPopView *passwordPopView = [[[NSBundle mainBundle] loadNibNamed:@"PasswordPopView" owner:self options:nil] lastObject];
    passwordPopView.frame = self.view.bounds;
    passwordPopView.delegate = self;
    //TODO 密码提示
    passwordPopView.passwordTips = @"";
    [passwordPopView showInView:self.view];
}

#pragma mark - PasswordPopViewDelegate

- (void)popView:(PasswordPopView *)popView didConfirm:(NSString *)password {
    if (!ISEMPTY(password)) {
        [popView hide];
        //TODO 转账
    } else {
        [self showToast:@"请输入密码"];
    }
}

@end
