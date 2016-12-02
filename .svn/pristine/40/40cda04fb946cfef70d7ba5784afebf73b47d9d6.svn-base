//
//  TMXPrinterHistoryCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXPrinterHistoryCellDelegate <NSObject>

- (void)printFile;
- (void)deleteFile;

@end
@interface TMXPrinterHistoryCell : UITableViewCell

@property (nonatomic, weak)id<TMXPrinterHistoryCellDelegate>delegate;

@end
