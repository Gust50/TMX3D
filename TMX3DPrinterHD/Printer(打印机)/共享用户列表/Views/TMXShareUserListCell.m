//
//  TMXShareUserListCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXShareUserListCell.h"

@interface TMXShareUserListCell ()
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation TMXShareUserListCell

#pragma mark <lazyLoad>
- (UIImageView *)iconView{

    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.masksToBounds = YES;
        _iconView.layer.cornerRadius = 20;
        _iconView.image = [UIImage imageNamed:@"Design_select"];
    }
    return _iconView;
}

- (UILabel *)nameLabel{

    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColor(102, 102, 102);
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"隔壁老王的小姨子";
    }
    return _nameLabel;
}

- (UILabel *)timeLabel{

    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColor(102, 102, 102);
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.text = @"2016-10-31 23:30";
    }
    return _timeLabel;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine=[UIView new];
        _bottomLine.backgroundColor=RGBColor(228, 233, 234);
    }
    return _bottomLine;
}


#pragma mark <init>
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.bottomLine];
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.width.mas_equalTo(@40);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-8);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-1);
        make.height.mas_equalTo(@(1));
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
