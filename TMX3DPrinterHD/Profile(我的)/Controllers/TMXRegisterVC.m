//
//  TMXRegisterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXRegisterVC.h"
#import "TMXRegisterView.h"
#import "TMXAccountRegisterModel.h"

@interface TMXRegisterVC ()<TMXRegisterViewDelegate>
{
    TMXAccountRegisterModel *tMXAccountRegisterModel;
    NSString *inputUserName;
    NSString *inputPassword;
    NSString *inputRepeatPassword;
    NSString *inputCode;
    BOOL isSelectProtrol;       ///<判断是否选择协议
}
@property (nonatomic, strong) TMXRegisterView *registerView;
@end

@implementation TMXRegisterVC

-(TMXRegisterView *)registerView{
    if (!_registerView) {
        _registerView=[TMXRegisterView new];
        _registerView.delegate = self;
    }
    return _registerView;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _registerView.isUpdateUI=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    tMXAccountRegisterModel=[[TMXAccountRegisterModel alloc]init];
    if (self.isRegister) {
        [self.navigationItem setTitle:@"账号注册"];
        _registerView.passwordStr = @"请输入6-12位密码";
        _registerView.confirmPasswordStr = @"确认密码";
    }else
    {
        [self.navigationItem setTitle:@"重置密码"];
        _registerView.passwordStr = @"请输入新密码";
        _registerView.confirmPasswordStr = @"确认新密码";
    }
    
    [self.view addSubview:self.registerView];
    self.registerView.isRegister = self.isRegister;
    
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    [_registerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - setter getter
-(void)setIsRegister:(BOOL)isRegister
{
    _isRegister = isRegister;
}

#pragma mark <TMXRegisterViewDelegate>
-(void)clickUserName:(NSString *)userName passWord:(NSString *)passWord repeatPassWord:(NSString *)repeatPassWord phone:(NSString *)phone code:(NSString *)code
{
    inputUserName = userName;
    inputPassword = passWord;
    inputRepeatPassword = repeatPassWord;
    inputCode = code;
    if ([self ValidateIsSuccess]) {
        
        NSMutableDictionary * needsparams = [NSMutableDictionary dictionary];
        needsparams[@"username"] = userName;
        needsparams[@"enPassword"] = [KBRSA encryptString:inputPassword publicKey:[FetchAppPublicKeyModel shareAppPublicKeyManager].publicKey];
        needsparams[@"mobile"] = phone;
        needsparams[@"smsToken"] = inputCode;
        
        if (!_isRegister)
        {
            [tMXAccountRegisterModel FetchTMXAccountResetPhoneNumData:needsparams callBack:^(BOOL isSuccess, id result) {
                if (isSuccess)
                {
                    [MBProgressHUD showSuccess:@"重置密码成功!"];
                    NSMutableDictionary *info=[NSMutableDictionary dictionary];
                    info[@"username"]=inputUserName;
                    info[@"password"]=nil;
                    if (self.delegate && [self.delegate respondsToSelector:@selector(returnBackAccountInfo:)])
                    {
                        [self.delegate returnBackAccountInfo:info];
                    }
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else
                {
                    [MBProgressHUD showError:result];
                }
            }];
            
        }else
        {
//            if (isSelectProtrol) {
                [tMXAccountRegisterModel FetchTMXAccountRegisterData:needsparams callBack:^(BOOL isSuccess, id result) {
                    if (isSuccess)
                    {
                        [MBProgressHUD showSuccess:@"注册成功!"];
                        NSMutableDictionary *info=[NSMutableDictionary dictionary];
                        info[@"username"]=inputUserName;
                        info[@"password"]=inputPassword;
                        if (self.delegate && [self.delegate respondsToSelector:@selector(returnBackAccountInfo:)])
                        {
                            [self.delegate returnBackAccountInfo:info];
                        }
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }else
                    {
                        
                        [MBProgressHUD showError:result];
                    }
                }];
            }
//        else
//            {
//                [MBProgressHUD showError:@"请接受版权声明"];
//                return;
//            }
//        }
    }
}

//表单验证
- (BOOL)ValidateIsSuccess{
    
    if (![KBRegexp validateUserName:inputUserName])
    {
        [MBProgressHUD showError:@"请输入正确的用户名"];
        return NO;
    }else if ([KBRegexp isBlankString:inputPassword])
    {
        [MBProgressHUD showError:@"请输入正确的密码"];
        return NO;
    }else if (inputPassword.length<5)
    {
        [MBProgressHUD showError:@"用户密码的长度至少6位"];
        return NO;
    }else if (![inputPassword isEqualToString:inputRepeatPassword])
    {
        [MBProgressHUD showError:@"两次输入密码不一致"];
        return NO;
    }else if (inputCode.length==0)
    {
        [MBProgressHUD showError:@"请输入正确的验证码"];
        return NO;
    }else
    {
        return YES;
    }
}

@end
