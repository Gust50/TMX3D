//
//  TMXHomeModelRemarkCell.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeModelRemarkCell.h"

@interface TMXHomeModelRemarkCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *remarkLab;

@property (nonatomic, assign) CGFloat remarkHeight;
@end


@implementation TMXHomeModelRemarkCell

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"ReplaceIcon"];
        _icon.layer.cornerRadius = 15;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.text = @"小黄人";
        
    }
    return _nameLab;
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

-(UILabel *)remarkLab{
    if (!_remarkLab) {
        _remarkLab=[UILabel new];
        _remarkLab.numberOfLines = 0;
        _remarkLab.font = [UIFont systemFontOfSize:11];
        _remarkLab.textColor = RGBColor(64, 64, 64);
    }
    return _remarkLab;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self initUI];
        self.remarkHeight=20.0;
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.nameLab];
    [self addSubview:self.timeLab];
    [self addSubview:self.remarkLab];
    [self updateConstraints];
}


-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(weakSelf.mas_left).with.offset(-10);
        make.bottom.equalTo(_icon.mas_centerY);
        make.height.mas_equalTo(@(15));
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_icon.mas_centerY);
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(weakSelf.mas_left).with.offset(-10);
        make.height.mas_equalTo(@(15));
    }];
    
    [_remarkLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.top.equalTo(_icon.mas_bottom).with.offset(5);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
    }];
    
    [_remarkLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(_remarkHeight));
    }];
   
}


@end
