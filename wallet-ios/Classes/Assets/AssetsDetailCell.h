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
@property (nonatomic, assign) double balance;
@property (nonatomic, assign) double price;
@property (nonatomic, copy) NSString *assetsType;

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
