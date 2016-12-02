//
//  TMXPrinterControlView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXPrinterControlViewDelegate <NSObject>

- (void)topBtn:(NSInteger)btnTag;
- (void)clickBtn:(NSInteger)btnTag;
- (void)bottomBtn:(NSInteger)btnTag;
- (void)temChange:(UISlider *)slider;
@end
@interface TMXPrinterControlView : UIView

@property (nonatomic, weak)id<TMXPrinterControlViewDelegate>delegate;

@end
