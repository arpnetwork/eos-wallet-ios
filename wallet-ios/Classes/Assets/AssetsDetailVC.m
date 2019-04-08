//
//  AssetsDetailVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "AssetsDetailVC.h"

#import "AssetsDetailCell.h"
#import "TransactionCell.h"
#import "TransactionDetailVC.h"
#import "TransferVC.h"

#define SectionHeaderH 38

@interface AssetsDetailVC () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *records;

@property (nonatomic, assign) double eosBalance;
@property (nonatomic, assign) double bhkdBalance;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *assetsType;
@property (nonatomic, assign) double price;
@end

@implementation AssetsDetailVC

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.eosBalance = ((NSNumber *)[dict valueForKey:@"EOS_BALANCE"]).doubleValue;
//        self.eosBalance = self.eosBalance > -1 ? self.eosBalance : 0;
        self.bhkdBalance = ((NSNumber *)[dict valueForKey:@"BHKD_BALANCE"]).doubleValue;
//        self.bhkdBalance = self.bhkdBalance > -1 ? self.bhkdBalance : 0;
        self.account = [dict valueForKey:@"ACCOUNT"];
        self.assetsType = [dict valueForKey:@"ASSETS_TYPE"];
        self.price = ((NSNumber *)[dict valueForKey:@"ASSETS_PRICE"]).doubleValue;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@资产", self.assetsType];
    //TODO
    self.records = @[@"111", @"222", @"333", @"444", @"555", @"666", @"777", @"888", @"999", @"000", @"666", @"777", @"888", @"999", @"000"];
    [self setupViews];
}

- (void)setupViews {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = nil;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:AssetsDetailCellNib bundle:nil] forCellReuseIdentifier:AssetsDetailCellID];
    [self.tableView registerNib:[UINib nibWithNibName:TransactionCellNib bundle:nil] forCellReuseIdentifier:TransactionCellID];
}

- (IBAction)receiptButtonClicked:(id)sender {
}

- (IBAction)transferButtonClicked:(id)sender {
    TransferVC *transferVC = [[TransferVC alloc] initWithDict:@{@"EOS_BALANCE": [NSNumber numberWithDouble:self.eosBalance],
                                                                @"BHKD_BALANCE": [NSNumber numberWithDouble:self.bhkdBalance],
                                                                @"ACCOUNT": self.account,
                                                                @"ASSETS_TYPE": self.assetsType}];
    [self.navigationController pushViewController:transferVC animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return [self.records count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        AssetsDetailCell *assetsDetailCell = [AssetsDetailCell cellWithTableView:tableView forIndexPath:indexPath];
        assetsDetailCell.assetsType = self.assetsType;
        assetsDetailCell.price = self.price;
        assetsDetailCell.balance = [@"EOS" isEqualToString:self.assetsType] ? self.eosBalance : self.bhkdBalance;
        cell = assetsDetailCell;
    } else {
        TransactionCell *transactionCell = [TransactionCell cellWithTableView:tableView forIndexPath:indexPath];
        cell = transactionCell;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 186;
    } else {
        return 60;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001f;
    } else {
        return SectionHeaderH;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, SectionHeaderH)];
        sectionHeader.backgroundColor = BgColor;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 11, 80, 16)];
        titleLabel.text = @"交易记录";
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithHex:999999];
        [sectionHeader addSubview:titleLabel];
        return sectionHeader;
    } else {
        return nil;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section != 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TransactionDetailVC *vc = [[TransactionDetailVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
