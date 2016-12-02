//
//  TMXcommentFromMessageCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXcommentFromMessageCell.h"

#define LeftTitleColor     [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define RightTitleColor    [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]
@interface TMXcommentFromMessageCell()

@property(nonatomic,strong)UIImageView *iconImageV;
@property(nonatomic,strong)UIButton *nextBtn;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *detail;

@end
@implementation TMXcommentFromMessageCell

-(UIImageView *)iconImageV{
    if (!_iconImageV) {
        _iconImageV = [UIImageView new];
        _iconImageV.image = [UIImage imageNamed:@"Layer"];
    }
    return _iconImageV;
}
- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton new];
        [_nextBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
    }
    return _nextBtn;
}
- (UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.text = [NSString stringWithFormat:@"骑猪闯世界-评论了你的模型"];
        _title.textColor = LeftTitleColor;
        _title.textAlignment = NSTextAlignmentLeft;
    }
    return _title;
}

- (UILabel *)detail{
    if (!_detail) {
        _detail = [UILabel new];
        _detail.numberOfLines = 0;
        _detail.text = @"这个模型好票量啊，我真的好喜欢，希望以后有更好的模型传上来。这个模型好票量啊，我真的好喜欢，希望以后有更好的模型传上来。";
        _detail.textColor = RightTitleColor;
        _detail.textAlignment = NSTextAlignmentLeft;
    }
    return _detail;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.iconImageV];
    [self addSubview:self.nextBtn];
    [self addSubview:self.title];
    [self addSubview:self.detail];
    
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15*APPScale);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@(weakSelf.height - 30));
        make.width.equalTo(@(140*APPScale));
//        make.width.equalTo(@(_iconImageV.height*1.5));
    }];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_iconImageV.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-20*APPScale);
        make.size.mas_offset(CGSizeMake(30*APPScale, 30*APPScale));
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageV.mas_right).offset(30*APPScale);
        make.right.equalTo(_nextBtn.mas_right).offset(-45*APPScale);
        make.height.equalTo(@(weakSelf.height/6));
        make.top.equalTo(weakSelf.mas_top).offset(weakSelf.height/6);
    }];
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_title.mas_left);
        make.right.equalTo(_title.mas_right);
        make.top.equalTo(weakSelf.mas_centerY).offset(3*APPScale);
        make.height.equalTo(@(weakSelf.height/3));
    }];
}
@end
