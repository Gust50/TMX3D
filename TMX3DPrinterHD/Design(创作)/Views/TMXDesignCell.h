//
//  TMXDesignCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMXDesignCell : UITableViewCell
@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, copy) NSString *iconURL;
@property (nonatomic, copy) NSString *mainSubText;
@property (nonatomic, copy) NSString *subText;
@property (nonatomic, strong) UIColor *mainTextColor;
@end
