//
//  TMXSelectUserHeadCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectUserHeadCell.h"

@implementation TMXSelectUserHeadCell
#pragma mark <lazyLoad>
- (UIButton *)backBtn{

    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_backBtn setImage:[UIImage imageNamed:@"return_back"] forState:(UIControlStateNormal)];
        [_backBtn setTitle:@" 返回" forState:(UIControlStateNormal)];
        [_backBtn setTitleColor:RGBColor(53, 535, 53) forState:(UIControlStateNormal)];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _backBtn;
}

- (UILabel *)headLabel{

    if (!_headLabel) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.text = @"选择用户";
        _headLabel.textColor = RGBColor(53, 53, 53);
        _headLabel.font = [UIFont systemFontOfSize:14];
    }
    return _headLabel;
}

- (UIButton *)cancelBtn{

    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_cancelBtn setImage:[UIImage imageNamed:@"CancelIcon"] forState:(UIControlStateNormal)];
    }
    return _cancelBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
        self.backgroundColor = RGBColor(246, 246, 246);
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.backBtn];
    [self addSubview: self.headLabel];
    [self addSubview:self.cancelBtn];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];
    
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
