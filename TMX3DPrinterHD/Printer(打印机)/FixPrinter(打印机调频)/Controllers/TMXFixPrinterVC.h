//
//  TMXFixPrinterVC.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBaseVC.h"

@protocol TMXFixPrinterVCDelegate <NSObject>

- (void)clickNextVC;

@end
@interface TMXFixPrinterVC : TMXBaseVC

@property (nonatomic, weak)id<TMXFixPrinterVCDelegate>delegate;
@property (nonatomic, assign)BOOL isHide;
@property (nonatomic, assign) BOOL nextTrail;
@property (nonatomic, assign) BOOL nextRight;
@property (nonatomic, assign) BOOL nextLeft;
@property (nonatomic, assign) BOOL nextCenter;
@property (nonatomic, copy) NSString *printerId;
@property (nonatomic, copy) NSString *imageName;
@end
