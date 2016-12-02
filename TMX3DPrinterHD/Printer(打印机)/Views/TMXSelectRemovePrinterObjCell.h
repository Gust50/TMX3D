//
//  TMXSelectRemovePrinterObjCell.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^managerRemoveBlock)();
typedef void(^owerRemoveBlock)();
@interface TMXSelectRemovePrinterObjCell : UITableViewCell

@property (nonatomic, strong)UIButton *managerBtn;
@property (nonatomic, strong)UIButton *owerBtn;

@property (nonatomic, assign)BOOL isSelectOwerBtn;
@property (nonatomic, copy)managerRemoveBlock managerRemoveblock;
@property (nonatomic, copy)owerRemoveBlock owerRemoveblock;

@end
