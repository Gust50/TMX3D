//
//  TMXAdvertiseWebVC.m
//  TMX3DPrinter
//
//  Created by kobe on 16/9/20.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAdvertiseWebVC.h"
#import <WebKit/WebKit.h>


@interface TMXAdvertiseWebVC ()<WKNavigationDelegate,WKUIDelegate>
{
     MBProgressHUD *hud;
}
@property (nonatomic, strong) WKWebView *web;
@end

@implementation TMXAdvertiseWebVC

#pragma mark <lazyLoad>
-(WKWebView *)web{
    if (!_web) {
        _web=[WKWebView new];
        _web.navigationDelegate=self;
    }
    return _web;
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}


//-(void)loadJS{
//    NSString *js = @"var count = document.images.length;for (var i = 0; i < count; i++) {var image = document.images[i];image.style.width=320;};window.alert('找到' + count + '张图');";
//    // 根据JS字符串初始化WKUserScript对象
//    WKUserScript *script = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    // 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//    [config.userContentController addUserScript:script];
//    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
//    [_webView loadHTMLString:@"<head></head><img src='http://www.nsu.edu.cn/v/2014v3/img/background/3.jpg' />"baseURL:nil];
//}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.web];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:_webUrl]];
    [_web loadRequest:request];
    hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.backgroundColor=[UIColor clearColor];
    hud.color=[UIColor clearColor];
    hud.activityIndicatorColor=systemColor;
    
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
         [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [hud hide:YES];
}


#pragma mark <getter setter>
-(void)setWebUrl:(NSString *)webUrl{
    _webUrl=webUrl;
}

@end
