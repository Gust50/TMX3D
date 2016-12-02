//
//  TMXProfileHeaderView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXProfileHeaderView.h"

@interface TMXProfileHeaderView ()
@property (nonatomic, strong) UIImageView *backImg;
@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *settingBtn;

@end

@implementation TMXProfileHeaderView

-(UIImageView *)backImg
{
    if (!_backImg) {
        _backImg = [UIImageView new];
        _backImg.image = [UIImage imageNamed:@"HeadBackground"];
    }
    return _backImg;
}

-(UIImageView *)userIcon
{
    if (!_userIcon) {
        _userIcon = [UIImageView new];
        _userIcon.image = [UIImage imageNamed:@"IconWhite"];
    }
    return _userIcon;
}

-(UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton new];
        _loginBtn.backgroundColor = systemColor;
        _loginBtn.layer.cornerRadius = 3;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginBtn.layer.borderWidth = 1;
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_loginBtn setTitle:@"登录 / 注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

-(UIButton *)settingBtn
{
    if (!_settingBtn) {
        _settingBtn = [UIButton new];
        [_settingBtn setImage:[UIImage imageNamed:@"SetupIcon"] forState:UIControlStateNormal];
        [_settingBtn addTarget:self action:@selector(setUp) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingBtn;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.backImg];
    [self addSubview:self.userIcon];
    [self addSubview:self.loginBtn];
    [self addSubview:self.settingBtn];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_centerY).with.offset(10);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_centerY).with.offset(40);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    
    [_settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
}

//登录注册
- (void)login
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickLogin:)]) {
        [self.delegate clickLogin:self];
    }
}

//设置
- (void)setUp
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSetup:)]) {
        [self.delegate clickSetup:self];
    }
}



@end
