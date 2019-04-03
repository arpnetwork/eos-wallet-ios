//
//  AssetsDetailCell.h
//  wallet-ios
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AssetsDetailCellNib @"AssetsDetailCell"
#define AssetsDetailCellID @"AssetsDetailCell"

@interface AssetsDetailCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
