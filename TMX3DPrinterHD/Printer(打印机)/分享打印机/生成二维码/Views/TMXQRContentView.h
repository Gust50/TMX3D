//
//  TMXQRContentView.h
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMXQRContentView : UIView

@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UILabel *headLabel;
@property (nonatomic, strong)UIButton *cancelBtn;

@property (nonatomic, strong)UIImageView *QRimageView;
@property (nonatomic, strong)UILabel *shareLabel;
@property (nonatomic, strong)UILabel *attentionLabel1;
@property (nonatomic, strong)UILabel *attentionLabel2;
@property (nonatomic, strong)UILabel *attentionLabel3;
@property (nonatomic, strong)UIButton *completeBtn;

@end
