//
//  AssetsDetailCell.m
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "AssetsDetailCell.h"

@implementation AssetsDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:AssetsDetailCellID forIndexPath:indexPath];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
