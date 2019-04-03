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

#define SectionHeaderH 38

@interface AssetsDetailVC () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *records;
@end

@implementation AssetsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"EOS资产";
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
