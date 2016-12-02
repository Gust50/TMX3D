//
//  TMXUnBindPrinterSelectionView.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/28.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol unBindPrinterSelectionCellSelectDelegate <NSObject>

- (void)goUnBindPrintertaskList;  //任务列表
- (void)motifyUnBindPtinterName;  //修改备注
- (void)removeSharePrinter;      //解除绑定

@end

@interface TMXUnBindPrinterSelectionView : UIView

@property (nonatomic, weak)id <unBindPrinterSelectionCellSelectDelegate>delegate;

-(void)useAnimation;
@end
