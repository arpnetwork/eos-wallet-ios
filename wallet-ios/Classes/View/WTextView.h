//
//  WTextView.h
//  wallet-ios
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTextViewDelegate <NSObject>
@optional
- (void)layoutChanged:(CGFloat)height;
@end

@interface WTextView : UITextView
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, weak) id<WTextViewDelegate> wdelegate;
@end
