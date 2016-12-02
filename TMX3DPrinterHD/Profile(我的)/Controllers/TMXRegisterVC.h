//
//  TMXRegisterVC.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBaseVC.h"

@protocol TMXRegisterVCDelegate <NSObject>

-(void)returnBackAccountInfo:(NSDictionary *)dict;

@end
@interface TMXRegisterVC : TMXBaseVC

@property (nonatomic, assign)BOOL isRegister;

@property (nonatomic, weak) id<TMXRegisterVCDelegate>delegate;

@end
