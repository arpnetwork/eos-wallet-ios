//
//  TransactionCell.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TransactionCell.h"

@implementation TransactionCell

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:TransactionCellID forIndexPath:indexPath];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
