//
//  TMXRegisterView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXRegisterView.h"
#import "TMXAccountRegisterModel.h"

@interface TMXRegisterView ()<UITextFieldDelegate>
{
    TMXAccountRegisterModel *tMXAccountRegisterModel;
    BOOL isSelectPro;
}
@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UIImageView *passwordIcon;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIImageView *confirmIcon;
@property (nonatomic, strong) UITextField *confirmTextField;
@property (nonatomic, strong) UIImageView *phoneIcon;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UIImageView *validateIcon;
@property (nonatomic, strong) UITextField *validateTextFiled;
@property (nonatomic, strong) UIView *lineOne;
@property (nonatomic, strong) UIView *lineTwo;
@property (nonatomic, strong) UIView *lineThree;
@property (nonatomic, strong) UIView *lineFour;
@property (nonatomic, strong) KBLabel *validateLab;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIImageView *hookIcon;
@property (nonatomic, strong) UILabel *describe;
@property (nonatomic, strong) KBLabel *describeLab;

@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UILabel *versionLab;

@end

@implementation TMXRegisterView

#pragma mark <lazyLoad>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"Icon"];
    }
    return _icon;
}

-(UIView *)layerView{
    if (!_layerView) {
        _layerView=[UIView new];
        _layerView.layer.borderWidth = 2;
        _layerView.layer.borderColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0].CGColor;
        _layerView.layer.cornerRadius = 10;
    }
    return _layerView;
}

-(UIImageView *)userIcon{
    if (!_userIcon) {
        _userIcon=[UIImageView new];
        _userIcon.image = [UIImage imageNamed:@"UserNameIcon"];
    }
    return _userIcon;
}

-(UITextField *)userTextField{
    if (!_userTextField) {
        _userTextField=[UITextField new];
        _userTextField.placeholder = @"请输入用户名";
        _userTextField.font = [UIFont systemFontOfSize:13];
        _userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _userTextField;
}


-(UIImageView *)passwordIcon{
    if (!_passwordIcon) {
        _passwordIcon=[UIImageView new];
        _passwordIcon.image = [UIImage imageNamed:@"PasswordIcon"];
        
    }
    return _passwordIcon;
}

-(UITextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField=[UITextField new];
        _passwordTextField.placeholder = @"请输入6-12位密码";
        _passwordTextField.font = [UIFont systemFontOfSize:13];
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _passwordTextField;
}

-(UIImageView *)confirmIcon{
    if (!_confirmIcon) {
        _confirmIcon=[UIImageView new];
        _confirmIcon.image = [UIImage imageNamed:@"PasswordIcon"];
    }
    return _confirmIcon;
}

-(UITextField *)confirmTextField
{
    if (!_confirmTextField) {
        _confirmTextField=[UITextField new];
        _confirmTextField.placeholder = @"确认密码";
        _confirmTextField.font = [UIFont systemFontOfSize:13];
        _confirmTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _confirmTextField;
}

-(UIImageView *)phoneIcon{
    if (!_phoneIcon) {
        _phoneIcon=[UIImageView new];
        _phoneIcon.image = [UIImage imageNamed:@"phone_gray"];
    }
    return _phoneIcon;
}

-(UITextField *)phoneTextField
{
    if (!_phoneTextField) {
        _phoneTextField=[UITextField new];
        _phoneTextField.placeholder = @"请输入手机号";
        _phoneTextField.font = [UIFont systemFontOfSize:13];
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.delegate = self;
    }
    return _phoneTextField;
}

-(UIImageView *)validateIcon{
    if (!_validateIcon) {
        _validateIcon=[UIImageView new];
        _validateIcon.image = [UIImage imageNamed:@"CodeIcon"];
    }
    return _validateIcon;
}

-(UITextField *)validateTextFiled{
    if (!_validateTextFiled) {
        _validateTextFiled=[UITextField new];
        _validateTextFiled.placeholder = @"请输入验证码";
        _validateTextFiled.font = [UIFont systemFontOfSize:13];
        _validateTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _validateTextFiled;
}

-(KBLabel *)validateLab{
    if (!_validateLab) {
        _validateLab=[KBLabel new];
        _validateLab.lineColor = [UIColor whiteColor];
        _validateLab.labelFont = [UIFont systemFontOfSize:11];
        _validateLab.type = bottomLine;
        _validateLab.text = @"获取验证码";
        _validateLab.font = [UIFont systemFontOfSize:11];
        _validateLab.textAlignment = NSTextAlignmentCenter;
        _validateLab.backgroundColor=[UIColor grayColor];
        _validateLab.userInteractionEnabled=NO;
        _validateLab.textColor=[UIColor whiteColor];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkPhoneNum)];
        [_validateLab addGestureRecognizer:gesture];
    }
    return _validateLab;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.userInteractionEnabled = YES;
    }
    return _bottomView;
}

-(UIImageView *)hookIcon{
    if (!_hookIcon) {
        _hookIcon=[UIImageView new];
        _hookIcon.image = [UIImage imageNamed:@"NoSelect"];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectProtol)];
        [_hookIcon addGestureRecognizer:gesture];
        _hookIcon.userInteractionEnabled = YES;
        isSelectPro = NO;
    }
    return _hookIcon;
}

-(UILabel *)describe
{
    if (!_describe) {
        _describe = [UILabel new];
        _describe.font = [UIFont systemFontOfSize:11];
        _describe.text = @"注册即接受并遵守马顿科技";
    }
    return _describe;
}

-(KBLabel *)describeLab{
    if (!_describeLab) {
        _describeLab=[KBLabel new];
        _describeLab.lineColor = systemColor;
        _describeLab.labelFont = [UIFont systemFontOfSize:11];
        _describeLab.type = bottomLine;
        _describeLab.font = [UIFont systemFontOfSize:11];
        _describeLab.textColor = systemColor;
        _describeLab.textAlignment = NSTextAlignmentCenter;
        _describeLab.text = @"版权声明";
        _describeLab.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(copyrightNotice)];
        [_describeLab addGestureRecognizer:gesture];
    }
    return _describeLab;
}

-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn=[UIButton buttonWithType:0];
        _registerBtn.backgroundColor = systemColor;
        _registerBtn.layer.cornerRadius = 5;
        _registerBtn.layer.masksToBounds = YES;
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerCount) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

-(UILabel *)versionLab{
    if (!_versionLab) {
        _versionLab=[UILabel new];
        _versionLab.textAlignment = NSTextAlignmentCenter;
        _versionLab.font = [UIFont systemFontOfSize:8];
        _versionLab.textColor = RGBColor(179, 179, 179);
        _versionLab.text = @"2015 Yeehaw Telecom Co,Ltd All right reserved.v1.0";
        
    }
    return _versionLab;
}

-(UIView *)lineOne
{
    if (!_lineOne) {
        _lineOne = [UIView new];
        _lineOne.backgroundColor = RGBColor(241, 242, 242);
    }
    return _lineOne;
}

-(UIView *)lineTwo
{
    if (!_lineTwo) {
        _lineTwo = [UIView new];
        _lineTwo.backgroundColor = RGBColor(241, 242, 242);
    }
    return _lineTwo;
}

-(UIView *)lineThree
{
    if (!_lineThree) {
        _lineThree = [UIView new];
        _lineThree.backgroundColor = RGBColor(241, 242, 242);
    }
    return _lineThree;
}

-(UIView *)lineFour
{
    if (!_lineFour) {
        _lineFour = [UIView new];
        _lineFour.backgroundColor = RGBColor(241, 242, 242);
    }
    return _lineFour;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        tMXAccountRegisterModel=[[TMXAccountRegisterModel alloc]init];
        [self initUI];
    }
    return self;
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.layerView];
    [_layerView addSubview:self.userIcon];
    [_layerView addSubview:self.userTextField];
    [_layerView addSubview:self.lineOne];
    [_layerView addSubview:self.passwordIcon];
    [_layerView addSubview:self.passwordTextField];
    [_layerView addSubview:self.lineTwo];
    [_layerView addSubview:self.confirmIcon];
    [_layerView addSubview:self.confirmTextField];
    [_layerView addSubview:self.phoneIcon];
    [_layerView addSubview:self.phoneTextField];
    [_layerView addSubview:self.lineThree];
    [_layerView addSubview:self.validateIcon];
    [_layerView addSubview:self.validateTextFiled];
    [_layerView addSubview:self.validateLab];
    [self addSubview:self.bottomView];
    [_bottomView addSubview:self.hookIcon];
    [_bottomView addSubview:self.describe];
    [_bottomView addSubview:self.describeLab];
    [self addSubview:self.registerBtn];
    [self addSubview:self.versionLab];
    [self addSubview:self.lineFour];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    //icon
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(64);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    
    //LayerView
    [_layerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(weakSelf.width/1.5, 200));
    }];
    
    [_confirmIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_confirmTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_confirmTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@((weakSelf.layerView.height-4)/5));
        make.centerY.equalTo(_layerView.mas_centerY);
        make.left.equalTo(_confirmIcon.mas_right).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
    }];
    
    [_lineTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_confirmTextField.mas_top);
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(1));
    }];
    
    [_passwordIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_passwordTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_passwordTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@((weakSelf.layerView.height-4)/5));
        make.bottom.equalTo(_lineTwo.mas_top);
        make.left.equalTo(_passwordIcon.mas_right).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
    }];
    
    [_lineOne mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.bottom.equalTo(_passwordTextField.mas_top);
        make.height.mas_equalTo(@(1));
    }];
    
    [_userIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_userTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_userTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_layerView.mas_top);
        make.bottom.equalTo(_lineOne.mas_top);
        make.left.equalTo(_userIcon.mas_right).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
    }];
    
    [_lineThree mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_confirmTextField.mas_bottom);
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(1));
    }];
    
    [_phoneIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_phoneTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_phoneTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineThree.mas_bottom);
        make.left.equalTo(_phoneIcon.mas_right).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@((weakSelf.layerView.height-4)/5));
    }];
    
    [_lineFour mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom);
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(1));
    }];
    
    [_validateIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).with.offset(10);
        make.centerY.equalTo(_validateTextFiled.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_validateTextFiled mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_layerView.mas_bottom);
        make.left.equalTo(_validateIcon.mas_right).with.offset(10);
        make.right.equalTo(_validateLab.mas_left).with.offset(-10);
        make.top.equalTo(_lineFour.mas_bottom);
    }];
    
    [_validateLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_layerView.mas_right).with.offset(-10);
        make.centerY.equalTo(_validateTextFiled.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_layerView.mas_bottom).with.offset(20);
        make.left.right.equalTo(_layerView);
    }];
    
    [_describe mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bottomView.mas_centerX);
        make.top.equalTo(_bottomView.mas_top);
        make.size.mas_equalTo(CGSizeMake(140, 20));
    }];
    
    [_describeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_describe.mas_right);
        make.top.equalTo(_bottomView.mas_top);
        make.size.mas_equalTo(CGSizeMake(45, 20));
    }];
    
    [_hookIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_describe.mas_centerY);
        make.right.equalTo(_describe.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    if (self.isRegister) {
        [_registerBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.top.equalTo(_describeLab.mas_bottom).with.offset(10);
            make.left.right.equalTo(_layerView);
            make.height.mas_equalTo(@(40));
        }];
    }else
    {
        [_registerBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.top.equalTo(_layerView.mas_bottom).with.offset(20);
            make.left.right.equalTo(_layerView);
            make.height.mas_equalTo(@(40));
        }];
    }
    
    [_versionLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-10);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.left.right.equalTo(_layerView);
        make.height.mas_equalTo(@(15));
    }];
}

#pragma mark - setter getter
-(void)setIsRegister:(BOOL)isRegister
{
    _isRegister = isRegister;
    [self updateConstraints];
    if (isRegister) {
        _bottomView.hidden = NO;
        _passwordTextField.placeholder = @"请输入6-12位密码";
        _confirmTextField.placeholder = @"确认密码";
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    }else
    {
        _bottomView.hidden = YES;
        _passwordTextField.placeholder = @"请输入新密码";
        _confirmTextField.placeholder = @"确认新密码";
        [_registerBtn setTitle:@"确定" forState:UIControlStateNormal];
    }
}

-(void)setPasswordStr:(NSString *)passwordStr
{
    _passwordTextField.placeholder = passwordStr;
}

-(void)setConfirmPasswordStr:(NSString *)confirmPasswordStr
{
    _confirmTextField.placeholder = confirmPasswordStr;
}

//验证手机号
- (void)checkPhoneNum
{
    if ([KBRegexp checkPhoneNumInput:self.phoneTextField.text])
    {
        
        NSMutableDictionary *params=[NSMutableDictionary dictionary];
        params[@"mobile"]=self.phoneTextField.text;
        [tMXAccountRegisterModel FetchTMXAccountCheckPhoneNumData:params callBack:^(BOOL isSuccess, id result) {
            if (isSuccess) {
                tMXAccountRegisterModel = result;
                
                if (!_isRegister) {
                    if (!tMXAccountRegisterModel.result) {
                        [self getVerification];
                    }else{
                        [MBProgressHUD showError:@"该手机号未注册"];
                    }
                }else
                {
                    if (tMXAccountRegisterModel.result) {
                        [self getVerification];
                    }else{
                        [MBProgressHUD showError:@"该手机号已注册"];
                    }
                }
            }else
            {
                [MBProgressHUD showError:result];
            }
            
        }];
    }else
    {
        [MBProgressHUD showError:@"手机号码错误!"];
        self.validateLab.backgroundColor=[UIColor grayColor];
    }
}

//获取验证码
- (void)getVerification
{
    if (!_isRegister)
    {
        
        NSMutableDictionary *params=[NSMutableDictionary dictionary];
        params[@"mobile"]=self.phoneTextField.text;
        params[@"type"]=@(2);
        [tMXAccountRegisterModel PostTMXAccountPhoneNumData:params callBack:^(BOOL isSuccess, id result) {
            if (isSuccess) {
                [MBProgressHUD showSuccess:NSLocalizedString(@"Code_Sending", nil)];
                KBTimer *tiemr=[[KBTimer alloc]init];
                [tiemr countDown:self.validateLab];
            }else
            {
                [MBProgressHUD showSuccess:result];
            }
        }];
    }else
    {
        
        NSMutableDictionary *params=[NSMutableDictionary dictionary];
        params[@"mobile"]=self.phoneTextField.text;
        params[@"type"]=@(1);
        [tMXAccountRegisterModel PostTMXAccountPhoneNumData:params callBack:^(BOOL isSuccess, id result) {
            if (isSuccess) {
                [MBProgressHUD showSuccess:NSLocalizedString(@"Code_Sending", nil)];
                KBTimer *tiemr=[[KBTimer alloc]init];
                [tiemr countDown:self.validateLab];
            }else
            {
                [MBProgressHUD showSuccess:result];
            }
        }];
    }
}

//版权声明
- (void)copyrightNotice
{
    
}

//注册
- (void)registerCount
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickUserName:passWord:repeatPassWord:phone:code:)]) {
        [self.delegate clickUserName:_userTextField.text passWord:_passwordTextField.text repeatPassWord:_confirmTextField.text phone:_phoneTextField.text code:_validateTextFiled.text];
    }
}

//是否选择协议
- (void)selectProtol
{
    isSelectPro = !isSelectPro;
    if (isSelectPro) {
        self.hookIcon.image = [UIImage imageNamed:@"Select"];
    }else
    {
        self.hookIcon.image = [UIImage imageNamed:@"NoSelect"];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (self.phoneTextField==textField)
    {
        NSString *str=[textField.text stringByReplacingCharactersInRange:range withString:string];
        if (str.length==11) {
            if ([KBRegexp checkPhoneNumInput:str])
            {
                self.validateLab.backgroundColor=systemColor;
                self.validateLab.userInteractionEnabled=YES;
            }else
            {
                self.validateLab.backgroundColor=[UIColor grayColor];
                self.validateLab.userInteractionEnabled=NO;
            }
            
        }else{
            self.validateLab.backgroundColor=[UIColor grayColor];
            self.validateLab.userInteractionEnabled=NO;
        }
    }
    return YES;
}

@end
