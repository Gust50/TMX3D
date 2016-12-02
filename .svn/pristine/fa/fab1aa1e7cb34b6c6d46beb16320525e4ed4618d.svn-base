//
//  TMXEditNickNameView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/14.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXEditNickNameView.h"

@interface TMXEditNickNameView ()
@property (nonatomic, strong)UITextField *inputNickName;
@property (nonatomic, strong)UILabel *describe;
@property (nonatomic, strong)UIButton *confirm;
@end
@implementation TMXEditNickNameView

-(UITextField *)inputNickName
{
    if (!_inputNickName) {
        _inputNickName = [UITextField new];
        _inputNickName.font = [UIFont systemFontOfSize:14];
        _inputNickName.placeholder = @"请输入昵称";
        _inputNickName.backgroundColor = [UIColor whiteColor];
        _inputNickName.clearButtonMode = UITextFieldViewModeWhileEditing;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        _inputNickName.leftView = view;
        _inputNickName.leftViewMode = UITextFieldViewModeAlways;
        _inputNickName.delegate = self;
    }
    return _inputNickName;
}

-(UILabel *)describe
{
    if (!_describe) {
        _describe = [UILabel new];
        _describe.font = [UIFont systemFontOfSize:11];
        _describe.text = @"*用户名可有中文、英文、特殊字符组成，最多不超过10个字。";
        _describe.textColor = RGBColor(152, 152, 152);
        _describe.backgroundColor = backGroundColor;
    }
    return _describe;
}

-(UIButton *)confirm
{
    if (!_confirm) {
        _confirm = [UIButton new];
        _confirm.backgroundColor = systemColor;
        _confirm.layer.cornerRadius = 5;
        _confirm.layer.masksToBounds = YES;
        _confirm.titleLabel.font = [UIFont systemFontOfSize:14];
        [_confirm setTitle:@"确定" forState:UIControlStateNormal];
        [_confirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirm addTarget:self action:@selector(returnTop) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirm;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = backGroundColor;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.inputNickName];
    [self addSubview:self.describe];
    [self addSubview:self.confirm];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_inputNickName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(74);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(@(40));
    }];
    [_describe mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_inputNickName.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(15));
    }];
    [_confirm mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_describe.mas_bottom).with.offset(50);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(250, 40));
    }];
}
//确定修改
- (void)returnTop
{
    if (self.TMXEditNickNameViewBlock) {
        self.TMXEditNickNameViewBlock(_inputNickName.text);
    }
}

#pragma mark - setter getter
-(void)setDescribeStr:(NSString *)describeStr
{
    _describe.text = describeStr;
}

-(void)setPlaceHolder:(NSString *)placeHolder
{
    _inputNickName.placeholder = placeHolder;
}

-(void)setNickName:(NSString *)nickName
{
    _inputNickName.text = nickName;
}

@end
