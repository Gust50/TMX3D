//
//  TMXBindPrinterSelectionView.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/27.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BindPrinterSelectionCellSelectDelegate <NSObject>

- (void)goPrinterCenter;//打印机中心
- (void)sharePrinter;   //分享打印机
- (void)shareUserList;  //分享用户列表
- (void)goTaskList;     //任务列表
- (void)goMotifyName;   //备注名称
- (void)resetPrinterWifi;//重设打印机WIFI
- (void)removeBindPrinter;   //解除绑定
@end

@interface TMXBindPrinterSelectionView : UIView

@property (nonatomic, weak)id <BindPrinterSelectionCellSelectDelegate> delegate;
@property (nonatomic, assign) BOOL isUpdateAnimation;
-(void)useAnimation;
@end
