//
//  TMXAddPrinterWifiView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXAddPrinterWifiViewDelegate <NSObject>

- (void)clickIsSeePassword:(BOOL)passwordIsSee;
- (void)clickIsRememPassword:(BOOL)passwordIsRemember;
- (void)clickIsSelectWifi:(BOOL)wifiIsSelect;
- (void)clickIsSelectWifi:(BOOL)wifiIsSelect centerPoint:(CGPoint)centerPoint width:(CGFloat)width;
@end
typedef void(^addWifiBlock)();

@interface TMXAddPrinterWifiView : UIView
@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, copy)addWifiBlock addWifiBlock;

@property (nonatomic, weak)id<TMXAddPrinterWifiViewDelegate>delegate;
@end
