//
//  TMXConnectWifiVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXConnectWifiVC.h"
#import "TMXConnectPrinterWifiView.h"
#import "TMXStatusWifiVC.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "TMXAddPrinterModel.h"
#import <AFNetworking.h>

@interface TMXConnectWifiVC ()
{
    TMXAddPrinterApikeyModel *printerApikeyModel;
    TMXAddPrinterModel *addPrinterModel;
    NSUserDefaults *userDefaults;
}
@property (nonatomic, strong) TMXConnectPrinterWifiView *connectWifi;
@property (nonatomic, assign) NSInteger resetTimeMax;   ///<等待打印机重置时间
@property (nonatomic, assign) NSInteger timeMax;
@end

@implementation TMXConnectWifiVC

-(TMXConnectPrinterWifiView *)connectWifi{
    if (!_connectWifi) {
        _connectWifi=[TMXConnectPrinterWifiView new];
    }
    return _connectWifi;
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:@"连接打印机WiFi"];
    [self.view addSubview:self.connectWifi];
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
    WS(weakSelf);
    _connectWifi.addWifiNextBlock=^{
        TMXStatusWifiVC *statusWifiVC = [TMXStatusWifiVC new];
        [weakSelf.navigationController pushViewController:statusWifiVC animated:YES];
    };
    
    userDefaults=[NSUserDefaults standardUserDefaults];
    printerApikeyModel=[[TMXAddPrinterApikeyModel alloc]init];
    addPrinterModel=[[TMXAddPrinterModel alloc]init];
    
    self.timeMax=0;
}



-(void)updateViewConstraints{
    [super updateViewConstraints];
    [_connectWifi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end
