//
//  TMXHome3DCustomView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/24.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMXHome3DCustomView : UIView
@property (nonatomic, copy) NSString *mainTitleText;
@property (nonatomic, copy) NSString *subTitleText;
@property (nonatomic, copy) NSString *iconUrlText;
@property (nonatomic, assign) BOOL isUpdateUI;

@property (nonatomic, strong) UIColor *color;
@end
