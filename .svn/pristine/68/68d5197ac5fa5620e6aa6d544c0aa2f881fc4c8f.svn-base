//
//  TMXAppLoginView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAppLoginView.h"

@interface TMXAppLoginView ()

@property(nonatomic,strong)UIImageView *logoImageV;
@property(nonatomic,strong)UIView *layerView;
@property(nonatomic,strong)UITextField *userNameText;
@property(nonatomic,strong)UITextField *passWord;
@property(nonatomic,strong)UILabel*lineLabel;
@property(nonatomic,strong)UIImageView *userNameLogo;
@property(nonatomic,strong)UIImageView *passWordLogo;

@property(nonatomic,strong)UIButton *registerBtn;
@property(nonatomic,strong)UIButton *lostPassWordBtn;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UILabel *bottomLab;

@end

@implementation TMXAppLoginView
#pragma mark <lazyLoad>

- (UIImageView *)logoImageV{
    if (!_logoImageV) {
        _logoImageV = [UIImageView new];
        _logoImageV.image = [UIImage imageNamed:@"Icon"];
        _logoImageV.layer.cornerRadius = 40;
    }
    return _logoImageV;
}
- (UIView *)layerView{
    if (!_layerView) {
        _layerView = [UIView new];
        _layerView.layer.borderWidth = 2;
        _layerView.layer.borderColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0].CGColor;
        _layerView.layer.cornerRadius = 10;
    }
    return _layerView;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [UILabel new];
        _lineLabel.layer.borderColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0].CGColor;
        _lineLabel.layer.borderWidth = 1;
    }
    return _lineLabel;
}
- (UIImageView *)userNameLogo{
    if (!_userNameLogo) {
        _userNameLogo = [UIImageView new];
        _userNameLogo.image = [UIImage imageNamed:@"UserNameIcon"];
    }
    return _userNameLogo;
}
- (UIImageView *)passWordLogo{
    if (!_passWordLogo) {
        _passWordLogo = [UIImageView new];
        _passWordLogo.image = [UIImage imageNamed:@"PasswordIcon"];
    }
    return _passWordLogo;
}
- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [UITextField new];
        _userNameText.placeholder = @"请输入用户名";
        _userNameText.font = [UIFont systemFontOfSize:13];
        _userNameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _userNameText;
}
- (UITextField *)passWord{
    if (!_passWord) {
        _passWord = [UITextField new];
        _passWord.placeholder = @"请输入密码";
        _passWord.font = [UIFont systemFontOfSize:13];
        _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        
    }
    return _passWord;
}
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton new];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UIButton *)lostPassWordBtn{
    if (!_lostPassWordBtn) {
        _lostPassWordBtn = [UIButton new];
        _lostPassWordBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_lostPassWordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_lostPassWordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_lostPassWordBtn addTarget:self action:@selector(lostPassWordAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lostPassWordBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton new];
        [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:systemColor];
        _loginBtn.layer.cornerRadius = 10;
        [_loginBtn addTarget:self action:@selector(loginAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UILabel *)bottomLab{
    if (!_bottomLab) {
        _bottomLab = [UILabel new];
        _bottomLab.textAlignment = NSTextAlignmentCenter;
        _bottomLab.font = [UIFont systemFontOfSize:8];
        _bottomLab.textColor = RGBColor(179, 179, 179);
        _bottomLab.text = @"2015 Yeehaw Telecom Co,Ltd All right reserved.v1.0";
    }
    return _bottomLab;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    [self addSubview:self.logoImageV];
    
    [self addSubview:self.layerView];
    [_layerView addSubview:self.lineLabel];
    [_layerView addSubview:self.userNameLogo];
    [_layerView addSubview:self.passWordLogo];
    [_layerView addSubview:self.userNameText];
    [_layerView addSubview:self.passWord];
    
    [self addSubview:self.registerBtn];
    [self addSubview:self.lostPassWordBtn];
    
    [self addSubview:self.loginBtn];
    [self addSubview:self.bottomLab];
    [self updateConstraints];
}


-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_logoImageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(74);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_offset(CGSizeMake(80, 80));
    }];
    
    [_layerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.mas_equalTo(@(weakSelf.width/1.5));
        make.height.mas_equalTo(@120);
    }];
    
    
    [_userNameLogo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.size.mas_offset(CGSizeMake(20, 20));
        make.centerY.equalTo(_userNameText.mas_centerY);
    }];
    
    [_userNameText mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userNameLogo.mas_right).offset(10);
        make.top.equalTo(_layerView.mas_top);
        make.bottom.equalTo(_lineLabel.mas_top);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
    }];
    
    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.centerY.equalTo(_layerView.mas_centerY);
        make.height.mas_equalTo(@(1));
    }];
    
    
    [_passWordLogo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_passWord.mas_centerY);
        make.size.mas_offset(CGSizeMake(20, 20));
    }];
   
    [_passWord mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passWordLogo.mas_right).offset(10);
        make.top.equalTo(_lineLabel.mas_bottom);
        make.bottom.equalTo(_layerView.mas_bottom);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
    }];
    
    [_registerBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left);
        make.top.equalTo(_layerView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [_lostPassWordBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_layerView.mas_right);
        make.top.equalTo(_registerBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [_loginBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_registerBtn.mas_bottom).offset(30);
        make.left.equalTo(_registerBtn.mas_left);
        make.width.equalTo(_layerView.mas_width);
        make.height.mas_equalTo(@40);
    }];
    
    [_bottomLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.mas_equalTo(@(weakSelf.width/1.5));
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-20);
        make.height.mas_equalTo(@15);
    }];
}
//注册账号
- (void)registerAC{
    if (self.registerblock) {
        self.registerblock();
    }
}
//忘记密码
- (void)lostPassWordAC{
    if (self.lostPassWordblock) {
        self.lostPassWordblock();
    }
}
//登录
- (void)loginAC{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickInputUserName:inputPassword:)]) {
        [self.delegate clickInputUserName:_userNameText.text inputPassword:_passWord.text];
    }
}

@end
