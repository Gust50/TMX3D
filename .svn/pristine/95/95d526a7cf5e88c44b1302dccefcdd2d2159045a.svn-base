//
//  TMXAppLoginView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^registerBlock)();
typedef void(^lostPassWordBlock)();
@protocol TMXAppLoginViewDelegate <NSObject>

- (void)clickInputUserName:(NSString *)userName inputPassword:(NSString *)password;

@end
@interface TMXAppLoginView : UIView

@property(nonatomic,copy)registerBlock registerblock;
@property(nonatomic,copy)lostPassWordBlock lostPassWordblock;

@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, weak)id<TMXAppLoginViewDelegate>delegate;
@end
