//
//  AssetsDetailCell.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "AssetsDetailCell.h"

@interface AssetsDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *assetsTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cnyLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceTagLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation AssetsDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:AssetsDetailCellID forIndexPath:indexPath];
}

- (void)setupCNY {
    if (self.balance > -1 && self.price > 0) {
        [self.cnyLabel setText:[NSString stringWithFormat:@"≈ ¥%.2f CNY", self.balance * self.price]];
    }
}

- (void)setAssetsType:(NSString *)assetsType {
    _assetsType = assetsType;
    [self.assetsTypeLabel setText:[NSString stringWithFormat:@"总金额(%@)", self.assetsType]];
    [self.priceTagLabel setText:[NSString stringWithFormat:@"当前价格  %@/CNY", self.assetsType]];
}

- (void)setBalance:(double)balance {
    _balance = balance;
    if (self.balance > -1) {
        [self.balanceLabel setText:[NSString stringWithFormat:@"%.4f", self.balance]];
    }
    [self setupCNY];
}

- (void)setPrice:(double)price {
    _price = price;
    if (self.price > 0) {
        [self.priceLabel setText:[NSString stringWithFormat:@"%.4f", self.price]];
    }
    [self setupCNY];
}

@end
