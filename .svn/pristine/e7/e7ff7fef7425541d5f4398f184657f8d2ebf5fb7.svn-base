//
//  TMXFixPrinterView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXFixPrinterViewDelegate<NSObject>
@optional
-(void)clickNextBtn;
-(void)clickFixBtn:(UIButton *)fixBtn;
@end

@interface TMXFixPrinterView : UIView
@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, weak) id<TMXFixPrinterViewDelegate>delegate;

@property (nonatomic, copy)NSString *imageName;
@property (nonatomic, assign)BOOL isHide;

@end
