//
//  TMXFeedbackTitleCell.h
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/14.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXFeedbackTitleCellDelegate <NSObject>

- (void)clickLeftStr:(NSString *)leftStr rightStr:(NSString *)rightStr;

@end
@interface TMXFeedbackTitleCell : UITableViewCell

@property (nonatomic, copy)NSString *titleStr;
@property (nonatomic, copy)NSString *placehold;
@property (nonatomic, weak)id<TMXFeedbackTitleCellDelegate>delegate;
@end
