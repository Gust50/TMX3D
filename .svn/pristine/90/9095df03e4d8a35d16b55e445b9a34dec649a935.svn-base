//
//  TMXNullModelView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXNullModelView.h"

@interface TMXNullModelView ()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *title;
@end
@implementation TMXNullModelView

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"NullModel"];
    }
    return _icon;
}

-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.text = @"您还没有上传的3D模型！";
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:14];
        _title.textColor = RGBColor(160, 160, 160);
    }
    return _title;
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
    [self addSubview:self.icon];
    [self addSubview:self.title];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_centerY).with.offset(-5);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_icon.mas_bottom).with.offset(15);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(@(20));
    }];
}

@end
