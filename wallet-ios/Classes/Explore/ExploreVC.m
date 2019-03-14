//
//  ExploreVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ExploreVC.h"

#import <WebKit/WebKit.h>

@interface ExploreVC () <WKNavigationDelegate>
@property (weak, nonatomic) WKWebView *webView;

@end

@implementation ExploreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self request:@"https://www.baidu.com"];
}

- (void)setupViews {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
//    self.messageHandler = [[MessageHandler alloc] init];
//    self.messageHandler.delegate = self;
//    [userContentController addScriptMessageHandler:self.messageHandler name:@"umclient"];
    config.userContentController = userContentController;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) configuration:config];
    webView.navigationDelegate = self;
    webView.allowsLinkPreview = NO;
    [self.view addSubview:webView];
    self.webView = webView;
}

- (void)request:(NSString *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.f];
    [self.webView loadRequest:request];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    ILog(@"[%@] decidePolicyForNavigationAction. url = %@, navigationType = %d", NSStringFromClass([self class]), webView.URL.absoluteString, (int)navigationAction.navigationType);
    
//    self.navigationType = navigationAction.navigationType;
    decisionHandler(WKNavigationActionPolicyAllow);
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    ILog(@"[%@] didStartProvisionalNavigation. url = %@", NSStringFromClass([self class]), webView.URL.absoluteString);
    
//    self.currentPage = webView.URL.absoluteString;
//    self.emptyView.style = EmptyViewStyleLoading;
//    self.needRefresh = NO;
//    [self.messageHandler reset];
//    [self.messageHandler close];
//    if (self.active) {
//        [self didStartLoading:self.currentPage];
//    }
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    ILog(@"[%@] didCommitNavigation. url = %@", NSStringFromClass([self class]), webView.URL.absoluteString);
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    ILog(@"[%@] didFinishNavigation. url = %@", NSStringFromClass([self class]), webView.URL.absoluteString);
    
//    self.emptyView.hidden = YES;
//    ILog(@"navigationType = %d, needRefresh = %d", (int)self.navigationType, (int)self.needRefresh);
//    if (self.navigationType == WKNavigationTypeBackForward && self.needRefresh) {
//        [webView reload];
//    }
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error {
    ILog(@"[%@] didFailProvisionalNavigation. url = %@, error = %@", NSStringFromClass([self class]), webView.URL.absoluteString, error);
    
//    self.emptyView.style = EmptyViewStyleError;
}

@end
