//
//  BaseVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "BaseVC.h"

#import "UIImage+Util.h"

@interface BaseVC ()
@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ILog(@"[%@] viewDidLoad", NSStringFromClass(self.class));

    [self setupBackButton];
    self.view.backgroundColor = BgColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:BaseColor size:CGSizeMake(SCREEN_WIDTH, 1)] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)dealloc {
    ILog(@"[%@] dealloc", NSStringFromClass([self class]));
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setupBackButton {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"back_icon"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back_icon"];
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)showLoading {
}

- (void)hideLoading {
}

@end
