//
//  TMXSearchHistoryHeader.h
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXSearchHistoryHeaderDelegate <NSObject>

- (void)clickClearAllHistory;

@end
@interface TMXSearchHistoryHeader : UICollectionReusableView
@property (nonatomic, assign)BOOL isHideClearBtn;
@property (nonatomic, copy)NSString *content;

@property (nonatomic, weak)id<TMXSearchHistoryHeaderDelegate>delegate;
@end
