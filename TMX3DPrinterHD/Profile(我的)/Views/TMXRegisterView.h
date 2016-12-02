//
//  TMXRegisterView.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXRegisterViewDelegate <NSObject>

- (void)clickUserName:(NSString *)userName passWord:(NSString *)passWord repeatPassWord:(NSString *)repeatPassWord phone:(NSString *)phone code:(NSString *)code;

@end
@interface TMXRegisterView : UIView

@property (nonatomic, assign) BOOL isUpdateUI;
@property (nonatomic, assign) BOOL isRegister;
@property (nonatomic, weak)id<TMXRegisterViewDelegate>delegate;
@property (nonatomic, copy)NSString *passwordStr;
@property (nonatomic, copy)NSString *confirmPasswordStr;

@end
