//
//  TabBarVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TabBarVC.h"

#import "NavVC.h"
#import "WalletVC.h"
#import "ExploreVC.h"
#import "MyVC.h"
#import "UIImage+Util.h"

@interface TabBarVC () <UITabBarControllerDelegate>
@property (nonatomic, strong) UIViewController *currentVC;
@end

@implementation TabBarVC

+ (void)initialize {
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0x666666], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:BaseColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupVCs];
        self.tabBar.tintColor = BaseColor;
        self.delegate = self;
    }
    return self;
}

- (void)setupVCs {
    WalletVC *walletVC = [[WalletVC alloc] init];
    [self setupTabBarItem:walletVC.tabBarItem title:@"钱包" normalImage:@"tab_wallet_normal" selectedImage:@"tab_wallet_selected"];
    
    ExploreVC *exploreVC = [[ExploreVC alloc] init];
    [self setupTabBarItem:exploreVC.tabBarItem title:@"探索" normalImage:@"tab_explore_normal" selectedImage:@"tab_explore_selected"];
    
    MyVC *myVC = [[MyVC alloc] init];
    myVC.title = @"个人中心";
    [self setupTabBarItem:myVC.tabBarItem title:@"我的" normalImage:@"tab_mine_normal" selectedImage:@"tab_mine_selected"];

    NavVC *walletNav = [[NavVC alloc] initWithRootViewController:walletVC];
    NavVC *exploreNav = [[NavVC alloc] initWithRootViewController:exploreVC];
    NavVC *myNav = [[NavVC alloc] initWithRootViewController:myVC];
    self.currentVC = walletNav;

    self.viewControllers = [NSArray arrayWithObjects:walletNav, exploreNav, myNav, nil];
}


- (void)setupTabBarItem:(UITabBarItem *)tabbarItem title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    tabbarItem = [tabbarItem initWithTitle:title image:[UIImage imageNamed:normalImage] selectedImage:[UIImage imageNamed:selectedImage]];
}

#pragma mark - UITabbarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.currentVC = viewController;
}

@end
