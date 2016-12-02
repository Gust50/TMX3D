//
//  TMXCreateQRcodeView.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^removeQRcodeViewBlock)();

@interface TMXCreateQRcodeView : UIView

@property (nonatomic, copy)removeQRcodeViewBlock removeQRcodeViewblock;

- (void)useAnimation;

@end
