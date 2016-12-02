//
//  TMXDesignCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXDesignCell.h"


@interface TMXDesignCell ()
{
    CGFloat height;
}
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *describeLab;
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation TMXDesignCell

#pragma mark <lazyLoad>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
    }
    return _icon;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
    }
    return _nameLab;
}

-(UILabel *)describeLab{
    if (!_describeLab) {
        _describeLab=[UILabel new];
        _describeLab.numberOfLines=0;
        _describeLab.font = [UIFont systemFontOfSize:13];
        _describeLab.textColor = RGBColor(139, 139, 139);
        
    }
    return _describeLab;
}

-(UIImageView *)imageV
{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.image = [UIImage imageNamed:@"RightArrow"];
    }
    return _imageV;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.nameLab];
    [self addSubview:self.describeLab];
    [self addSubview:self.imageV];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(@(200));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_icon.mas_centerY).with.offset(-15);
        make.left.equalTo(_icon.mas_right).with.offset(20);
        make.right.equalTo(weakSelf.mas_right).with.offset(-60);
        make.height.mas_equalTo(@(20));
    }];
    
    [_describeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_icon.mas_centerY).with.offset(-15);
        make.left.equalTo(_nameLab.mas_left);
        make.right.equalTo(weakSelf.mas_right).with.offset(-60);
        make.height.mas_equalTo(@(70));
    }];
    
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(12, 15));
    }];
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)setIconURL:(NSString *)iconURL{
    _icon.image=[UIImage imageNamed:iconURL];
}
-(void)setMainSubText:(NSString *)mainSubText{
    _nameLab.text=mainSubText;
}
-(void)setSubText:(NSString *)subText{
    _describeLab.text=subText;
}
-(void)setMainTextColor:(UIColor *)mainTextColor{
    _nameLab.textColor=mainTextColor;
}
@end
