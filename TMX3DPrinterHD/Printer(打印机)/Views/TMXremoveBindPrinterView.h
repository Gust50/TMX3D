//
//  TMXremoveBindPrinterView.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol removeBindPrinterDelegate <NSObject>

- (void)goSelectUser;

@end
@interface TMXremoveBindPrinterView : UIView

@property (nonatomic, weak) id <removeBindPrinterDelegate> delegate;

@end
