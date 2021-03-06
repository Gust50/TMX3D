//
//  TMXLoginHeaderView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXLoginHeaderView.h"

@interface TMXLoginHeaderView ()
@property (nonatomic, strong) UIImageView *backImg;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *userName;
@property (nonatomic, strong) UILabel *sign;
@property (nonatomic, strong) UIButton *message;
@property (nonatomic, strong) UIButton *setup;
@property (nonatomic, strong) UIButton *personSetup;

@end
@implementation TMXLoginHeaderView

-(UIImageView *)backImg
{
    if (!_backImg) {
        _backImg = [UIImageView new];
        _backImg.image = [UIImage imageNamed:@"HeadBackground"];
        _backImg.userInteractionEnabled  = YES;
    }
    return _backImg;
}

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"ReplaceIcon"];
        _icon.layer.cornerRadius = 60;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

-(UILabel *)userName
{
    if (!_userName) {
        _userName = [UILabel new];
        _userName.font = [UIFont systemFontOfSize:14];
        _userName.textColor = [UIColor whiteColor];
        _userName.text = @"飞机模型";
    }
    return _userName;
}

-(UILabel *)sign
{
    if (!_sign) {
        _sign = [UILabel new];
        _sign.font = [UIFont systemFontOfSize:12];
        _sign.textColor = [UIColor whiteColor];
        _sign.text = @"个性签名：";
    }
    return _sign;
}

-(UIButton *)message
{
    if (!_message) {
        _message = [UIButton new];
        [_message setImage:[UIImage imageNamed:@"MessageIcon"] forState:UIControlStateNormal];
        [_message addTarget:self action:@selector(checkMessage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _message;
}

-(UIButton *)setup
{
    if (!_setup) {
        _setup = [UIButton new];
        [_setup setImage:[UIImage imageNamed:@"SetupIcon"] forState:UIControlStateNormal];
        [_setup addTarget:self action:@selector(checkSetup) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setup;
}

-(UIButton *)personSetup
{
    if (!_personSetup) {
        _personSetup = [UIButton new];
        [_personSetup setTitle:@"个人设置 >" forState:UIControlStateNormal];
        [_personSetup setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _personSetup.titleLabel.font = [UIFont systemFontOfSize:12];
        [_personSetup addTarget:self action:@selector(checkPersonSetup) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personSetup;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.backImg];
    [self.backImg addSubview:self.icon];
    [self.backImg addSubview:self.userName];
    [self.backImg addSubview:self.sign];
    [self.backImg addSubview:self.message];
    [self.backImg addSubview:self.setup];
    [self.backImg addSubview:self.personSetup];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backImg.mas_left).offset(30);
        make.centerY.equalTo(_backImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    
    [_setup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_backImg.mas_right).offset(-20);
        make.top.equalTo(_icon.mas_top);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_setup.mas_left).offset(-20);
        make.top.equalTo(_icon.mas_top);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_personSetup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_backImg.mas_right).offset(-20);
        make.bottom.equalTo(_icon.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(20);
        make.right.equalTo(_message.mas_left).offset(-10);
        make.bottom.equalTo(_icon.mas_centerY).offset(-5);
        make.height.mas_equalTo(@(20));
    }];
    
    [_sign mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(20);
        make.right.equalTo(_message.mas_left).offset(-10);
        make.top.equalTo(_icon.mas_centerY).offset(5);
        make.height.mas_equalTo(@(20));
    }];
}

//消息
- (void)checkMessage
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickMessage:)]) {
        [self.delegate clickMessage:self];
    }
}

//设置
- (void)checkSetup
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSetUp:)]) {
        [self.delegate clickSetUp:self];
    }
}

//个人设置
- (void)checkPersonSetup
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickPersonSetp:)]) {
        [self.delegate clickPersonSetp:self];
    }
}

#pragma mark - setter getter
-(void)setIconUrl:(NSString *)iconUrl
{
    [_icon sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:nil];
}

-(void)setName:(NSString *)name
{
    _userName.text = name;
    
}

-(void)setSignStr:(NSString *)signStr
{
    _sign.text = signStr;
}

@end
