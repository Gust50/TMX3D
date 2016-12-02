//
//  TMXStatusWifiVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXStatusWifiVC.h"
#import "TMXPrinterStatusWifiView.h"

@interface TMXStatusWifiVC ()
@property (nonatomic, strong) TMXPrinterStatusWifiView *statusWifi;
@end

@implementation TMXStatusWifiVC

-(TMXPrinterStatusWifiView *)statusWifi{
    if (!_statusWifi) {
        _statusWifi=[TMXPrinterStatusWifiView new];
    }
    return _statusWifi;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"连接状态"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.statusWifi];
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
    
    _statusWifi.startBlock=^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    };
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_statusWifi mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end
