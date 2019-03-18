//
//  WTextView.m
//  wallet-ios
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "WTextView.h"

@interface WTextView()
@property (nonatomic, weak) UILabel *placeholderLabel;
@end

@implementation WTextView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

//    self.backgroundColor = [UIColor colorWithHex:0xf2f2f2];
    self.scrollEnabled = NO;
    if (self.textContainerInset.top > 0) {
        self.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.placeholderLabel.frame = CGRectMake(5, 0, self.frame.size.width, self.font.lineHeight);
    }
    self.placeholderLabel.text = self.placeholder;
    self.placeholderLabel.textColor = self.placeholderColor;
    self.placeholderLabel.hidden = (self.text.length != 0);
}

- (void)setup {
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.hidden = YES;
    placeholderLabel.numberOfLines = 0;
    placeholderLabel.backgroundColor = [UIColor clearColor];
    placeholderLabel.font = self.font;
    [self insertSubview:placeholderLabel atIndex:0];
    self.placeholderLabel = placeholderLabel;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    if (!ISEMPTY(text)) {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
}

- (void)textDidChange {
    self.placeholderLabel.hidden = (self.text.length != 0);
    CGFloat h = [self heightForString:self.text font:self.font] + 0.5;
    if (self.wdelegate && [self.wdelegate respondsToSelector:@selector(layoutChanged:)]) {
        [self.wdelegate layoutChanged:h];
    }
}

- (CGFloat)heightForString:(NSString *)value font:(UIFont *)font {
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = [value boundingRectWithSize:CGSizeMake(self.frame.size.width - 10, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
