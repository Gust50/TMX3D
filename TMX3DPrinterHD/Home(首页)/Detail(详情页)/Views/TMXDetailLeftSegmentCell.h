//
//  TMXDetailLeftSegmentCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXDetailLeftSegmentCellDelegate <NSObject>

- (void)clickSegmentTag:(NSInteger)tag;

@end
@class TMXHomeModelDetailModel;
@interface TMXDetailLeftSegmentCell : UITableViewCell

@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, strong)TMXHomeModelDetailModel *detailModel;

@property (nonatomic, weak)id<TMXDetailLeftSegmentCellDelegate>delegate;
@end
