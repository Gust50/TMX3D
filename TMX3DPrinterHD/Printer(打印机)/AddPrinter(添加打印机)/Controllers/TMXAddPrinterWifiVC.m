//
//  TMXAddPrinterWifiVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAddPrinterWifiVC.h"
#import "TMXAddPrinterWifiView.h"
#import "TMXConnectWifiVC.h"
#import "KBDropMenuView.h"
#import "TMXSelectWifiView.h"

@interface TMXAddPrinterWifiVC ()<TMXSelectWifiViewDelegate, TMXAddPrinterWifiViewDelegate>
{
    NSUserDefaults *userDefaults;    ///<存储
    BOOL isSeePassword;              ///<是否显示密码
    KBDropMenuView *dropMenuView;
    TMXSelectWifiView *tMXSelectWifiView;
}
@property (nonatomic, strong) TMXAddPrinterWifiView *addWifiView;
@property (nonatomic,assign) BOOL isRememberPassword;
@property (nonatomic, assign) BOOL isClick;
@end

@implementation TMXAddPrinterWifiVC

-(TMXAddPrinterWifiView *)addWifiView{
    if (!_addWifiView) {
        _addWifiView=[TMXAddPrinterWifiView new];
        _addWifiView.delegate = self;
    }
    return _addWifiView;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _addWifiView.isUpdateUI=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"选择准备工作的WiFi"];
    self.view.backgroundColor=backGroundColor;
    [self.view addSubview:self.addWifiView];
    
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
    
    WS(weakSelf);
    _addWifiView.addWifiBlock=^{
      
        TMXConnectWifiVC *connectWifiVC=[TMXConnectWifiVC new];
        [weakSelf.navigationController pushViewController:connectWifiVC animated:YES];
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeView) name:@"removeSelectWifiView" object:nil];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_addWifiView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark <TMXAddPrinterWifiViewDelegate>

-(void)clickIsSelectWifi:(BOOL)wifiIsSelect centerPoint:(CGPoint)centerPoint width:(CGFloat)width{

    _isClick = wifiIsSelect;
    [self.view endEditing:YES];
    if (_isClick) {
        
        if (dropMenuView.menuState==MenuShow) return;
        tMXSelectWifiView=[[TMXSelectWifiView alloc]initWithFrame:CGRectMake(0, 0, width, 250)];
        tMXSelectWifiView.delegate=self;
        dropMenuView = [[KBDropMenuView alloc] initWithFrame:CGRectMake(0, 0, width, 250)];
        dropMenuView.contentView= tMXSelectWifiView;
        dropMenuView.anchorPoint = CGPointMake(0.5, 0);
        dropMenuView.origin = CGPointMake(0, 4);
        dropMenuView.backGroundImg = @"BackCartBack";
        [dropMenuView shoViewFromPoint:CGPointMake(centerPoint.x-width/2, centerPoint.y)];
        [self.view addSubview:dropMenuView];
    }else
    {
        [dropMenuView hideMenu];
    }
}


-(void)clickIsSeePassword:(BOOL)passwordIsSee
{
    isSeePassword = passwordIsSee;
}

-(void)clickIsRememPassword:(BOOL)passwordIsRemember
{
    _isRememberPassword = passwordIsRemember;
    if (passwordIsRemember) {
        [userDefaults setBool:NO forKey:@"rememberPassword"];
    }else
    {
        [userDefaults setBool:YES forKey:@"rememberPassword"];
    }
}

- (void)removeView
{
    [dropMenuView hideMenu];
}

@end
