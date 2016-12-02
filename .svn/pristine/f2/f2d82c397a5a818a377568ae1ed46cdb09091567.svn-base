//
//  TMXSelectPrintCell.m
//  TMX3DPrinterHD
//
//  Created by 吴桃波 on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectPrintCell.h"

@interface TMXSelectPrintCell ()
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *linkStatus;
@property (nonatomic, strong)UIImageView *selectIcon;
@end
@implementation TMXSelectPrintCell

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"Printer_gray"];
    }
    return _icon;
}

-(UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        _name.font = [UIFont systemFontOfSize:13];
        _name.text = @"打印机名称";
    }
    return _name;
}

-(UILabel *)linkStatus
{
    if (!_linkStatus) {
        _linkStatus = [UILabel new];
        _linkStatus.font = [UIFont systemFontOfSize:11];
        _linkStatus.textColor = RGBColor(174, 174, 174);
        _linkStatus.text = @"已连接";
        _linkStatus.textAlignment = NSTextAlignmentCenter;
    }
    return _linkStatus;
}

-(UIImageView *)selectIcon
{
    if (!_selectIcon) {
        _selectIcon = [UIImageView new];
    }
    return _selectIcon;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        _selectIcon.image = [UIImage imageNamed:@"Select"];
    }else
    {
        _selectIcon.image = [UIImage imageNamed:@""];
    }
}

- (void)initUI
{
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.linkStatus];
    [self addSubview:self.selectIcon];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(25);
        make.size.mas_equalTo(CGSizeMake(20, 25));
    }];
    
    [_selectIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-25);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_linkStatus mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.centerX.equalTo(weakSelf.mas_centerX).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    [_name mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(_linkStatus.mas_left).with.offset(-10);
        make.height.mas_equalTo(@(15));
    }];
}



@end
