//
//  TMXBgLoginVC.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBaseVC.h"

typedef void(^RemoveBgBlock)();

@interface TMXBgLoginVC : TMXBaseVC
@property (nonatomic, copy) RemoveBgBlock removeBgBlock;
@end
