//
//  TMXNotLoginView.h
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tMXNotLoginViewBlock)();
@interface TMXNotLoginView : UIView
@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, copy)tMXNotLoginViewBlock tMXNotLoginViewBlock;
@end
