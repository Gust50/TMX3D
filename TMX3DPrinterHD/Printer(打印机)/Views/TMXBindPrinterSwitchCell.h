//
//  TMXBindPrinterSwitchCell.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/28.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SwitchBlock)(BOOL isOn);
@interface TMXBindPrinterSwitchCell : UITableViewCell

@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UISwitch * selectSwitch;

@property (nonatomic, copy)SwitchBlock Switchblock;

@end
