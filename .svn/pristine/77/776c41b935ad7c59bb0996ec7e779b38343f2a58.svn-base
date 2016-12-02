//
//  TMXPopMenuFirstCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/27.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPopMenuFirstCell.h"

@implementation TMXPopMenuFirstCell
#pragma mark <lazyLoad>
- (UILabel *)describeLabel{

    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.text = @"打印机选项";
        _describeLabel.textAlignment = NSTextAlignmentCenter;
        _describeLabel.userInteractionEnabled = YES;
    }
    return _describeLabel;
}

- (UIButton *)cancelBtn{

    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        [_cancelBtn setImage:[UIImage imageNamed:@"CancelRightView"] forState:(UIControlStateNormal)];
        [_cancelBtn setTitleColor:systemColor forState:(UIControlStateNormal)];
        [_cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:(UIControlEventTouchUpInside)];
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

    [self addSubview:self.describeLabel];
    [_describeLabel addSubview:self.cancelBtn];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
    
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_describeLabel.mas_top);
        make.right.equalTo(_describeLabel.mas_right);
        make.bottom.equalTo(_describeLabel.mas_bottom);
        make.width.equalTo(@40);
    }];
}

- (void)clickCancelBtn{

    if (self.cancelblock) {
        self.cancelblock();
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
