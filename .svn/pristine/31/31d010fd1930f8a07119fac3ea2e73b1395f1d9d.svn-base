//
//  TMXLogoutFooterView.m
//  TMX3DPrinterHD
//
//  Created by 吴桃波 on 16/11/13.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXLogoutFooterView.h"

@interface TMXLogoutFooterView ()
@property (nonatomic, strong) UIButton *logoutBtn;
@end
@implementation TMXLogoutFooterView

-(UIButton *)logoutBtn
{
    if (!_logoutBtn) {
        _logoutBtn = [UIButton new];
        _logoutBtn.userInteractionEnabled = YES;
        _logoutBtn.backgroundColor = systemColor;
        _logoutBtn.layer.cornerRadius = 5;
        _logoutBtn.layer.masksToBounds = YES;
        _logoutBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = backGroundColor;
        [self addSubview:self.logoutBtn];
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_logoutBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).with.offset(-125);
        make.centerY.equalTo(weakSelf.mas_centerY).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(250, 40));
    }];
}

//退出登录
- (void)logout
{
    if (self.footerViewBlock) {
        self.footerViewBlock();
    }
}

-(void)setName:(NSString *)name
{
    [_logoutBtn setTitle:name forState:UIControlStateNormal];
}

@end
