//
//  TMXPrinterStatusCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXPrinterStatusCellDelegate <NSObject>

-(void)printerSwitchWire;
-(void)printerPause;
-(void)printerCancel;

@end
@interface TMXPrinterStatusCell : UITableViewCell

@property (nonatomic, weak)id<TMXPrinterStatusCellDelegate>delegate;

@end
