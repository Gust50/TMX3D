//
//  TMXSelectUserCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectUserCell.h"

@implementation TMXSelectUserCell

#pragma mark <lazyLoad>
- (UIImageView *)iconView{

    if (!_iconView ) {
        _iconView = [[UIImageView alloc] init];
        [_iconView setImage:[UIImage imageNamed:@"ModelRemark"]];
        _iconView.layer.masksToBounds = YES;
        _iconView.layer.cornerRadius = 20;
    }
    return _iconView;
}

- (UILabel *)nameLabel{

    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColor(53, 53, 53);
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UIImageView *)selectImage{

    if (!_selectImage) {
        _selectImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NoSelect"] highlightedImage:[UIImage imageNamed:@"Select"]];
    }
    return _selectImage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.selectImage];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@40);
        make.width.equalTo(@40);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_iconView.mas_right).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_selectImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    _selectImage.highlighted = selected;
}

@end
