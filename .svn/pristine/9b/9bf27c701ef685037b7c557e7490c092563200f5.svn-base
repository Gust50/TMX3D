//
//  TMXAboutView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAboutView.h"

@interface TMXAboutView ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *describeLab;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIImageView *netIcon;
@property (nonatomic, strong) UILabel *netLab;
@property (nonatomic, strong) UIImageView *weiboIcon;
@property (nonatomic, strong) UILabel *weiboLab;
@property (nonatomic, strong) UIImageView *wechatIcon;
@property (nonatomic, strong) UILabel *wechatLab;
@property (nonatomic, strong) UIImageView *emailIcon;
@property (nonatomic, strong) UILabel *emailLab;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation TMXAboutView

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"Logo"];
    }
    return _icon;
}

-(UILabel *)describeLab
{
    if (!_describeLab) {
        _describeLab = [UILabel new];
        _describeLab.font = [UIFont systemFontOfSize:14];
        _describeLab.textAlignment = NSTextAlignmentLeft;
        _describeLab.textColor = RGBColor(120, 120, 120);
        _describeLab.numberOfLines = 0;
        _describeLab.text = @"深圳马顿科技有限公司是属于高新技术行业，主营产品为天马星品牌3D打印机。集技术研发，产品设计，营销，生产，售后及3D模型应用，3D培训推广等服务为一体。力争成为行业最有竞争力的综合性服务商，打造终端客户3D打印机首选品牌。";
    }
    return _describeLab;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = backGroundColor;
    }
    return _bottomView;
}

-(UIImageView *)netIcon
{
    if (!_netIcon) {
        _netIcon =  [UIImageView new];
        _netIcon.image = [UIImage imageNamed:@"NetIcon"];
    }
    return _netIcon;
}

-(UILabel *)netLab
{
    if (!_netLab) {
        _netLab = [UILabel new];
        _netLab.font = [UIFont systemFontOfSize:12];
        _netLab.textColor = RGBColor(139, 139, 139);
        _netLab.text = @"yeehaw3d";
    }
    return _netLab;
}

-(UIImageView *)weiboIcon
{
    if (!_weiboIcon) {
        _weiboIcon =  [UIImageView new];
        _weiboIcon.image = [UIImage imageNamed:@"WeiboIcon"];
    }
    return _weiboIcon;
}

-(UILabel *)weiboLab
{
    if (!_weiboLab) {
        _weiboLab = [UILabel new];
        _weiboLab.font = [UIFont systemFontOfSize:12];
        _weiboLab.textColor = RGBColor(139, 139, 139);
        _weiboLab.text = @"Yeehaw3D打印";
    }
    return _weiboLab;
}

-(UIImageView *)wechatIcon
{
    if (!_wechatIcon) {
        _wechatIcon =  [UIImageView new];
        _wechatIcon.image = [UIImage imageNamed:@"WechatIcon"];
    }
    return _wechatIcon;
}

-(UILabel *)wechatLab
{
    if (!_wechatLab) {
        _wechatLab = [UILabel new];
        _wechatLab.font = [UIFont systemFontOfSize:12];
        _wechatLab.textColor = RGBColor(139, 139, 139);
        _wechatLab.text = @"www.yeehaw3d.com";
    }
    return _wechatLab;
}

-(UIImageView *)emailIcon
{
    if (!_emailIcon) {
        _emailIcon =  [UIImageView new];
        _emailIcon.image = [UIImage imageNamed:@"MailIcon"];
    }
    return _emailIcon;
}

-(UILabel *)emailLab
{
    if (!_emailLab) {
        _emailLab = [UILabel new];
        _emailLab.font = [UIFont systemFontOfSize:12];
        _emailLab.textColor = RGBColor(139, 139, 139);
        _emailLab.text = @"service@yeehaw3d.com";
    }
    return _emailLab;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.describeLab];
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.netIcon];
    [self.bottomView addSubview:self.netLab];
    [self.bottomView addSubview:self.weiboIcon];
    [self.bottomView addSubview:self.weiboLab];
    [self.bottomView addSubview:self.wechatIcon];
    [self.bottomView addSubview:self.wechatLab];
    [self.bottomView addSubview:self.emailIcon];
    [self.bottomView addSubview:self.emailLab];
}


-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(84);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [_describeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(50);
        make.right.equalTo(weakSelf.mas_right).with.offset(-50);
        make.top.equalTo(_icon.mas_bottom).with.offset(20);
        make.height.mas_equalTo(@(80));
    }];
    
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(50);
        make.right.equalTo(weakSelf.mas_right).with.offset(-50);
        make.top.equalTo(_describeLab.mas_bottom).with.offset(30);
        make.height.mas_equalTo(@(60));
    }];
    
    [_netIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_left);
        make.centerY.equalTo(_netLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [_netLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_netIcon.mas_right).with.offset(5);
        make.top.equalTo(_bottomView.mas_top);
        make.right.equalTo(_bottomView.mas_centerX);
        make.bottom.equalTo(_bottomView.mas_centerY);
    }];
    
    [_weiboIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_centerX);
        make.centerY.equalTo(_weiboLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(18, 15));
    }];
    
    [_weiboLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_weiboIcon.mas_right).with.offset(5);
        make.right.equalTo(_bottomView.mas_right);
        make.top.equalTo(_bottomView.mas_top);
        make.bottom.equalTo(_bottomView.mas_centerY);
    }];
    
    [_wechatIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_left);
        make.centerY.equalTo(_wechatLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(18, 15));
    }];
    
    [_wechatLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_wechatIcon.mas_right).with.offset(5);
        make.top.equalTo(_bottomView.mas_centerY);
        make.bottom.equalTo(_bottomView.mas_bottom);
        make.right.equalTo(_bottomView.mas_centerX);
    }];
    
    [_emailIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_centerX);
        make.centerY.equalTo(_emailLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(18, 15));
    }];
    
    [_emailLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_emailIcon.mas_right).with.offset(5);
        make.top.equalTo(_bottomView.mas_centerY);
        make.bottom.equalTo(_bottomView.mas_bottom);
        make.right.equalTo(_bottomView.mas_right);
    }];
}


@end
