//
//  TMXSetupCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSetupCell.h"

@interface TMXSetupCell ()
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *detailLab;
@property (nonatomic, strong) UIImageView *arrow;
@end

@implementation TMXSetupCell

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.text = @"清除缓存";
    }
    return _nameLab;
}

-(UILabel *)detailLab{
    if (!_detailLab) {
        _detailLab=[UILabel new];
        _detailLab.font = [UIFont systemFontOfSize:12];
        _detailLab.text = @"2.55M";
        _detailLab.textAlignment = NSTextAlignmentRight;
        _detailLab.textColor = [UIColor lightGrayColor];
    }
    return _detailLab;
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
    [self addSubview:self.nameLab];
    [self addSubview:self.detailLab];
    [self addSubview:self.arrow];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    [_detailLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrow.mas_left).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_nameLab.mas_right).with.offset(10);
        make.height.mas_equalTo(@(30));
    }];
    
    [_arrow mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-270);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
}

#pragma mark - setter getter
-(void)setIsArrow:(BOOL)isArrow
{
    _arrow.hidden = isArrow;
}

-(void)setLeftStr:(NSString *)leftStr
{
    _nameLab.text = leftStr;
}

-(void)setRightStr:(NSString *)rightStr
{
    _detailLab.text = rightStr;
}

@end
