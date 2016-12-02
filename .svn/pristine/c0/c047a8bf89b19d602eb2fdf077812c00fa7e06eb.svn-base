//
//  TMXBindPrinterSwitchCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/28.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBindPrinterSwitchCell.h"

@implementation TMXBindPrinterSwitchCell
#pragma mark <lazyLoad>
- (UILabel *)describeLabel{

    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.font = [UIFont systemFontOfSize:14];
        _describeLabel.textColor = RGBColor(53, 53, 53);
    }
    return _describeLabel;
}
- (UISwitch *)selectSwitch{

    if (!_selectSwitch) {
        _selectSwitch = [[UISwitch alloc] init];
        [_selectSwitch addTarget:self action:@selector(ClickedSwitch:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectSwitch;
}
#pragma mark <init>
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

#pragma mark <initUI>
- (void)initUI{

    [self addSubview:self.describeLabel];
    [self addSubview:self.selectSwitch];
    
    [self updateConstraints];
}

- (void)ClickedSwitch:(UISwitch *)selectSwitch{

    if (self.Switchblock) {
        self.Switchblock(selectSwitch.on);
    }
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@20);
    }];
    [_selectSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-25);
        make.width.equalTo(@30);
        make.height.equalTo(@25);
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
