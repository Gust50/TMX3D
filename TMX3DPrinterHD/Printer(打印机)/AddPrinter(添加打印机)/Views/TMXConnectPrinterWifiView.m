//
//  TMXConnectPrinterWifiView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXConnectPrinterWifiView.h"

@interface TMXConnectPrinterWifiView ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *describeLab;
@property (nonatomic, strong) UILabel *wifiName;
@property (nonatomic,strong) UIImageView *wifiIcon;
@property (nonatomic, strong) UIButton *connetBtn;
@end

@implementation TMXConnectPrinterWifiView

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"BottomIcon"];
    }
    return _icon;
}

-(UILabel *)describeLab{
    if (!_describeLab) {
        _describeLab=[UILabel new];
        _describeLab.font = [UIFont systemFontOfSize:12];
        _describeLab.textAlignment = NSTextAlignmentCenter;
        _describeLab.text = @"请将手机连接到“yeehaw3D_XXXX”即打印机热点后返回yeehaw智能APP";
        _describeLab.numberOfLines = 0;
    }
    return _describeLab;
}

-(UILabel *)wifiName{
    if (!_wifiName) {
        _wifiName=[UILabel new];
        _wifiName.font = [UIFont systemFontOfSize:12];
        _wifiName.text = @"yeehaw3d_7644";
        _wifiName.textColor = RGBColor(123, 123, 123);
    }
    return _wifiName;
}

-(UIImageView *)wifiIcon{
    if (!_wifiIcon) {
        _wifiIcon=[UIImageView new];
        _wifiIcon.image = [UIImage imageNamed:@"LinkWiFiSucIcon"];
    }
    return _wifiIcon;
}

-(UIButton *)connetBtn{
    if (!_connetBtn) {
        _connetBtn=[UIButton buttonWithType:0];
        _connetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _connetBtn.layer.cornerRadius = 5;
        _connetBtn.layer.masksToBounds = YES;
        [_connetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_connetBtn setTitle:@"连接打印机WiFi" forState:UIControlStateNormal];
        [_connetBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];
        _connetBtn.backgroundColor=systemColor;
    }
    return _connetBtn;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.describeLab];
    [self addSubview:self.wifiIcon];
    [self addSubview:self.wifiName];
    [self addSubview:self.connetBtn];
}

-(void)nextBtn:(UIButton *)btn{
    if (self.addWifiNextBlock) {
        self.addWifiNextBlock();
    }
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_centerY).with.offset(30);
        make.height.mas_equalTo(@(150));
    }];
    
    [_describeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_icon.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(300, 40));
    }];
    
    [_wifiName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.bottom.equalTo(_connetBtn.mas_top).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_wifiIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_wifiName.mas_left).with.offset(-10);
        make.bottom.equalTo(_connetBtn.mas_top).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_connetBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(300, 40));
    }];
}

@end
