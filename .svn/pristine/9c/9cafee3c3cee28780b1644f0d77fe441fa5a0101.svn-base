//
//  TMXSharePrinterTaskListTableViewCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSharePrinterTaskListTableViewCell.h"

@implementation TMXSharePrinterTaskListTableViewCell

#pragma mark <lazy load>
- (UIImageView *)iconImageView{

    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 3;
        _iconImageView.image = [UIImage imageNamed:@"Model_normal"];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{

    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColor(53, 53, 53);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"主线程vbnm";
    }
    return _nameLabel;
}

- (UILabel *)timeTakingLabel{

    if (!_timeTakingLabel) {
        _timeTakingLabel = [[UILabel alloc] init];
        _timeTakingLabel.font = [UIFont systemFontOfSize:12];
        _timeTakingLabel.text = @"耗时:03时20分";
    }
    return _timeTakingLabel;
}

- (UILabel *)materialTakeingLabel{

    if (!_materialTakeingLabel) {
        _materialTakeingLabel = [[UILabel alloc] init];
        _materialTakeingLabel.font = [UIFont systemFontOfSize:12];
        _materialTakeingLabel.text = @"耗材:1000000mm";
    }
    return _materialTakeingLabel;
}

- (UILabel *)statusLabel{

    if (!_statusLabel) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.font = [UIFont systemFontOfSize:14];
        _statusLabel.text = @"待打印";
    }
    return _statusLabel;
}
#pragma mark <init>
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

#pragma mark <init UI>
- (void)initUI{

    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.timeTakingLabel];
    [self addSubview: self.materialTakeingLabel];
    [self addSubview:self.statusLabel];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.height.equalTo(@80);
        make.width.equalTo(@80);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).with.offset(8);
        make.bottom.equalTo(_iconImageView.mas_centerY).with.offset(-5);
        make.height.equalTo(@20);
    }];
    
    [_timeTakingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).with.offset(8);
        make.top.equalTo(_iconImageView.mas_centerY).with.offset(5);
        
    }];
    
    
    [_materialTakeingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeTakingLabel.mas_right).with.offset(20);
        make.centerY.equalTo(_timeTakingLabel.mas_centerY);
    }];
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-20);
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
