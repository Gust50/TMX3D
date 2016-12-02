//
//  TMXBindPrintingTaskListTableViewCell.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBtopImgBottomTextBtn.h"

@interface TMXBindPrintingTaskListTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView * iconImageView;
@property (nonatomic, strong)UILabel * nameLabel;
@property (nonatomic, strong)UILabel * timeTakingLabel;
@property (nonatomic, strong)UILabel * materialTakeingLabel;
@property (nonatomic, strong)KBtopImgBottomTextBtn *cancelTaskBtn;
@property (nonatomic, strong)KBtopImgBottomTextBtn *taskSaveBtn;

@end
