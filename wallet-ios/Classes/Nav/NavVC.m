//
//  NavVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "NavVC.h"

#import "UIImage+Util.h"

@interface NavVC ()

@end

@implementation NavVC

+ (void)initialize {
    [self setupNavBarTheme];
    [self setupBarButtonItemTheme];
}

+ (void)setupNavBarTheme {
    UINavigationBar *navBar = [UINavigationBar appearance];

    //title font
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttrs];
    
    //bottom line
    [navBar setBackgroundImage:[UIImage imageWithColor:BaseColor size:CGSizeMake(SCREEN_WIDTH, 1)] forBarMetrics:UIBarMetricsDefault];
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)]) {
        [navBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(SCREEN_WIDTH, 3)]];
    }
}

+ (void)setupBarButtonItemTheme {
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
