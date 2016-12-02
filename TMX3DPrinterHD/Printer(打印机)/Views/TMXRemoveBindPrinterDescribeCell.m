//
//  TMXRemoveBindPrinterDescribeCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXRemoveBindPrinterDescribeCell.h"

@implementation TMXRemoveBindPrinterDescribeCell
#pragma mark <lazyLoad>
- (UILabel *)leftLabel{

    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = RGBColor(53, 53, 53);
        _leftLabel.font = [UIFont systemFontOfSize:14];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{

    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textColor = RGBColor(53, 53, 53);
        _rightLabel.font = [UIFont systemFontOfSize:14];
    }
    return _rightLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    [self addSubview:self.leftLabel];
    [self addSubview:self.rightLabel];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftLabel.mas_right).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
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
