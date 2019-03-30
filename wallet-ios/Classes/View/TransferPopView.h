//
//  TransferPopView.h
//  wallet-ios
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TransferPopView;

@protocol TransferPopViewDelegate <NSObject>
@optional
- (void)didClickTransferConfirmButton:(TransferPopView *)popView;
@end

@interface TransferPopView : UIView
@property (nonatomic, weak) id<TransferPopViewDelegate> delegate;
@property (nonatomic, copy) NSString *sender;
@property (nonatomic, copy) NSString *receiver;
@property (nonatomic, copy) NSString *memo;

- (void)showInView:(UIView *)view;
@end
