//
//  TMXHomeUpLoadUserInfoCell.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeUpLoadUserInfoCell.h"
#import "TMXHomeModelDetailModel.h"

@interface TMXHomeUpLoadUserInfoCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *userNameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *rightLab;
@property (nonatomic, strong) UIImageView *arrow;
@end

@implementation TMXHomeUpLoadUserInfoCell

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"ReplaceIcon"];
        _icon.layer.cornerRadius = 15;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

-(UILabel *)userNameLab{
    if (!_userNameLab) {
        _userNameLab=[UILabel new];
        _userNameLab.font = [UIFont systemFontOfSize:14];
        _userNameLab.text = @"我是小黄人";
    }
    return _userNameLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab=[UILabel new];
        _timeLab.font = [UIFont systemFontOfSize:11];
        _timeLab.textColor = RGBColor(182, 182, 182);
        _timeLab.text = @"2016-11-04";
        
    }
    return _timeLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab=[UILabel new];
        _rightLab.font = [UIFont systemFontOfSize:11];
        _rightLab.textColor = RGBColor(182, 182, 182);
        _rightLab.text = @"查看此用户的更多模型";
        _rightLab.textAlignment = NSTextAlignmentRight;
        
    }
    return _rightLab;
}

-(UIImageView *)arrow{
    if (!_arrow) {
        _arrow=[UIImageView new];
        _arrow.image = [UIImage imageNamed:@"DetailArow"];
    }
    return _arrow;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.userNameLab];
    [self addSubview:self.timeLab];
    [self addSubview:self.arrow];
    [self addSubview:self.rightLab];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.bottom.equalTo(_icon.mas_centerY);
        make.right.equalTo(_rightLab.mas_left).with.offset(10);
        make.height.mas_equalTo(@(15));
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(_rightLab.mas_left).with.offset(-10);
        make.top.equalTo(_icon.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [_rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_arrow.mas_left).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
}

#pragma mark - setter getter
-(void)setDetailModel:(TMXHomeModelDetailModel *)detailModel
{
    _detailModel = detailModel;
    [_icon sd_setImageWithURL:[NSURL URLWithString:detailModel.ownerAvatar] placeholderImage:nil];
    _userNameLab.text = detailModel.ownerName;
    
    NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([detailModel.updatedDate doubleValue]/1000.0)];
    NSString *timeString = [[KBDateFormatter shareInstance] stringFromDate:date];
    _timeLab.text = timeString;
}

@end
