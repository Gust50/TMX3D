//
//  TMXPrinterStatusHeader.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterStatusHeader.h"


@interface TMXPrinterStatusHeader ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIButton *refreshBtn;
@end

@implementation TMXPrinterStatusHeader

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"HistoryRecordIcon"];
    }
    return _icon;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
        _nameLab.text = @"历史打印记录";
        _nameLab.font = [UIFont systemFontOfSize:14];
    }
    return _nameLab;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        _refreshBtn=[UIButton buttonWithType:0];
        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _refreshBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
        [_refreshBtn setTitleColor:systemColor forState:UIControlStateNormal];
        [_refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
        [_refreshBtn setImage:[UIImage imageNamed:@"RefreshIcon"] forState:UIControlStateNormal];
        [_refreshBtn addTarget:self action:@selector(refreshRecord) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refreshBtn;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.nameLab];
    [self addSubview:self.refreshBtn];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(27, 28));
    }];
    
    [_nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(_refreshBtn.mas_left).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.mas_equalTo(@(20));
    }];
    
    [_refreshBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
}

//刷新
- (void)refreshRecord
{
    if (self.TMXPrinterStatusHeaderBlock) {
        self.TMXPrinterStatusHeaderBlock();
    }
}

@end
