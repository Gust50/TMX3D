//
//  TMXLoginHeaderView.h
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMXLoginHeaderView;
@protocol TMXLoginHeaderViewDelegate <NSObject>

- (void)clickMessage:(TMXLoginHeaderView *)loginHeaderView;
- (void)clickSetUp:(TMXLoginHeaderView *)loginHeaderView;
- (void)clickPersonSetp:(TMXLoginHeaderView *)loginHeaderView;

@end
@interface TMXLoginHeaderView : UIView

@property (nonatomic, weak)id<TMXLoginHeaderViewDelegate>delegate;
@property (nonatomic, copy)NSString *iconUrl;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *signStr;
@end
