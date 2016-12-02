//
//  TMXQRContentView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXQRContentView.h"

@implementation TMXQRContentView

#pragma mrak <lazyLoad>
- (UIButton *)backBtn{

    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
        [_backBtn setImage:[UIImage imageNamed:@""] forState:(UIControlStateNormal)];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_backBtn setTitleColor:RGBColor(53, 53, 53) forState:(UIControlStateNormal)];
    }
    return _backBtn;
}

- (UILabel *)headLabel{

    if (!_headLabel) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor  = RGBColor(53, 53, 53);
        _headLabel.text = @"生成二维码";
        _headLabel.font = [UIFont systemFontOfSize:14];
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.backgroundColor = RGBColor(246, 246, 246);
    }
    return _headLabel;
}

- (UIButton *)cancelBtn{

    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_cancelBtn setImage:[UIImage imageNamed:@"'"] forState:(UIControlStateNormal)];
    }
    return _cancelBtn;
}

- (UIImageView *)QRimageView{

    if (!_QRimageView) {
        _QRimageView = [[UIImageView alloc] init];
        _QRimageView.layer.masksToBounds = YES;
        _QRimageView.layer.cornerRadius = 5;
    }
    return _QRimageView;
}

- (UILabel *)shareLabel{

    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        _shareLabel.textColor = RGBColor(53, 53, 53);
        _shareLabel.font = [UIFont systemFontOfSize:13];
    }
    return _shareLabel;
}

- (UILabel *)attentionLabel1{

    if (!_attentionLabel1) {
        _attentionLabel1 = [[UILabel alloc] init];
        _attentionLabel1.textColor = RGBColor(102, 102, 102);
        _attentionLabel1.font = [UIFont systemFontOfSize:13];
        _attentionLabel1.numberOfLines = 0;
        _attentionLabel1.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _attentionLabel1;
}

- (UILabel *)attentionLabel2{

    if (!_attentionLabel2) {
        _attentionLabel2 = [[UILabel alloc] init];
        _attentionLabel2.textColor = RGBColor(102, 102, 102);
        _attentionLabel2.font = [UIFont systemFontOfSize:13];
        _attentionLabel2.numberOfLines = 0;
        _attentionLabel2.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _attentionLabel2;
}

- (UILabel *)attentionLabel3{

    if (!_attentionLabel3) {
        _attentionLabel3 = [[UILabel alloc] init];
        _attentionLabel3.textColor = RGBColor(102, 102, 102);
        _attentionLabel3.font = [UIFont systemFontOfSize:13];
        _attentionLabel3.numberOfLines = 0;
        _attentionLabel3.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _attentionLabel3;
}

- (UIButton *)completeBtn{

    if (!_completeBtn) {
        _completeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_completeBtn setTitle:@"完成" forState:(UIControlStateNormal)];
        [_completeBtn setBackgroundColor:systemColor];
        _completeBtn.layer.masksToBounds = YES;
        _completeBtn.layer.cornerRadius = 5;
    }
    return _completeBtn;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = RGBColor(237, 237, 237); 
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.headLabel];
    [_headLabel addSubview:self.backBtn];
    [_headLabel addSubview:self.cancelBtn];
    [self addSubview:self.QRimageView];
    [self addSubview:self.shareLabel];
    [self addSubview:self.attentionLabel1];
    [self addSubview:self.attentionLabel2];
    [self addSubview:self.attentionLabel3];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.height.equalTo(@50);
    }];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headLabel.mas_left);
        make.centerY.equalTo(_headLabel.mas_centerY);
        make.height.equalTo(@40);
        make.width.equalTo(@60);
    }];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headLabel.mas_right);
        make.centerY.equalTo(_headLabel.mas_centerY);
        make.height.equalTo(@40);
        make.width.equalTo(@60);
    }];
    
    [_QRimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_headLabel.mas_bottom).with.offset(30);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
    
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_QRimageView.mas_bottom).with.offset(-20);
    }];
    
    [_attentionLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(@150);
        make.top.equalTo(_shareLabel.mas_bottom).with.offset(20);
    }];
    
    [_attentionLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(@150);
        make.top.equalTo(_attentionLabel1.mas_bottom).with.offset(15);
    }];
    
    [_attentionLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(@150);
        make.top.equalTo(_attentionLabel2.mas_bottom).with.offset(15);
    }];
    
    [_completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.top.equalTo(_attentionLabel3.mas_bottom).with.offset(50);
    }];
}
@end
