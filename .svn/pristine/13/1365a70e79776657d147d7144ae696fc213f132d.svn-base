//
//  TMXSelectRemovePrinterObjCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectRemovePrinterObjCell.h"

@implementation TMXSelectRemovePrinterObjCell
#pragma mark <lazyLoad>
- (UIButton *)managerBtn{

    if (!_managerBtn) {
        _managerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_managerBtn setTitle:@"管理者解除" forState:(UIControlStateNormal)];
        _managerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_managerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        [_managerBtn setTitleColor:systemColor forState:(UIControlStateNormal)];
        [_managerBtn setBackgroundColor:systemColor];
        _managerBtn.layer.masksToBounds = YES;
        _managerBtn.layer.cornerRadius = 20;
        _managerBtn.layer.borderWidth = 1;
        _managerBtn.layer.borderColor = systemColor.CGColor;
        _managerBtn.selected = YES;
        [_managerBtn addTarget:self action:@selector(selectedManagerBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _managerBtn;
}

- (UIButton *)owerBtn{

    if (!_owerBtn) {
        _owerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_owerBtn setTitle:@"所有者解除" forState:(UIControlStateNormal)];
        _owerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_owerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        [_owerBtn setTitleColor:systemColor forState:(UIControlStateNormal)];
        [_owerBtn setBackgroundColor:[UIColor whiteColor]];
        _owerBtn.layer.masksToBounds = YES;
        _owerBtn.layer.cornerRadius = 20;
        _owerBtn.layer.borderWidth = 1;
        _owerBtn.layer.borderColor = systemColor.CGColor;
        _owerBtn.selected = NO;
        [_owerBtn addTarget:self action:@selector(seletedOwerBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _owerBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    [self updateConstraints];
}

- (void)initUI{

    [self addSubview:self.managerBtn];
    [self addSubview:self.owerBtn];
    
    
    [self updateConstraints];
}

#pragma mark <btn action>
- (void)selectedManagerBtn:(UIButton *)btn{
    
    if (btn.selected) {
        
    }else{
    
        btn.selected = YES;
        _owerBtn.selected = NO;
        [btn setBackgroundColor:systemColor];
        [_owerBtn setBackgroundColor:[UIColor whiteColor]];
    }
    if (self.managerRemoveblock) {
        self.managerRemoveblock();
    }
}

- (void)seletedOwerBtn:(UIButton *)btn{

    if (btn.selected) {
    }else{
    
        btn.selected = YES;
        _managerBtn.selected = NO;
        [btn setBackgroundColor:systemColor];
        [_managerBtn setBackgroundColor:[UIColor whiteColor]];
    }
    if (self.owerRemoveblock) {
        self.owerRemoveblock();
    }
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_managerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_centerX).with.offset(-50);
        make.height.equalTo(@40);
        make.width.equalTo(@(120));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_owerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_centerX).with.offset(50);
        make.height.equalTo(@40);
        make.width.equalTo(@(120));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}

- (void)setIsSelectOwerBtn:(BOOL)isSelectOwerBtn{

    _isSelectOwerBtn = isSelectOwerBtn;
    if (isSelectOwerBtn) {
        self.owerBtn.selected = YES;
        self.managerBtn.selected = NO;
        [_owerBtn setBackgroundColor:systemColor];
        [_managerBtn setBackgroundColor:[UIColor whiteColor]];
    }else{
        
        self.managerBtn.selected = YES;
        self.owerBtn.selected = NO;
        [_owerBtn setBackgroundColor:[UIColor whiteColor]];
        [_managerBtn setBackgroundColor:systemColor];
    }

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
