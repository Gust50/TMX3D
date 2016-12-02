//
//  TMXNotLoginView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXNotLoginView.h"
#import "KBLabel.h"

@interface TMXNotLoginView ()
{
    CGFloat describeWidth;
    CGFloat loginWidth;
}
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UILabel *describe;
@property (nonatomic, strong)KBLabel *login;

@end
@implementation TMXNotLoginView

-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

-(UILabel *)describe
{
    if (!_describe) {
        _describe = [UILabel new];
        _describe.textColor = RGBColor(157, 157, 157);
        _describe.text = @"亲爱的用户，您尚未登录，";
        _describe.textAlignment = NSTextAlignmentRight;
        _describe.font = [UIFont systemFontOfSize:13];
        CGSize size = [NSString sizeWithStr:_describe.text font:[UIFont systemFontOfSize:15] width:self.width];
        describeWidth = size.width;
    }
    return _describe;
}

-(KBLabel *)login
{
    if (!_login) {
        _login = [KBLabel new];
        _login.text = @"立即登录";
        _login.font = [UIFont systemFontOfSize:13];
        _login.textAlignment = NSTextAlignmentLeft;
        _login.textColor = systemColor;
        _login.labelFont = [UIFont systemFontOfSize:13];
        _login.type = bottomLine;
        _login.lineColor = systemColor;
        _login.userInteractionEnabled = YES;
        CGSize size = [NSString sizeWithStr:_login.text font:[UIFont systemFontOfSize:15] width:self.width];
        loginWidth = size.width;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(immediatelyLogin)];
        [_login addGestureRecognizer:gesture];
    }
    return _login;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.backView];
    [self.backView addSubview:self.describe];
    [self.backView addSubview:self.login];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_offset(CGSizeMake(describeWidth+loginWidth, 20));
    }];
    
    [_describe mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView.mas_left);
        make.centerY.equalTo(_backView.mas_centerY);
        make.size.mas_offset(CGSizeMake(describeWidth, 20));
    }];
    
    [_login mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_describe.mas_right);
        make.right.equalTo(_backView.mas_right);
        make.centerY.equalTo(_backView.mas_centerY);
        make.height.mas_offset(@(20));
    }];
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI
{
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

//立即登录
- (void)immediatelyLogin
{
    if (self.tMXNotLoginViewBlock) {
        self.tMXNotLoginViewBlock();
    }
}

@end
