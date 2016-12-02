//
//  TMXHomeIntroductModelCell.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeIntroductModelCell.h"

@interface TMXHomeIntroductModelCell ()

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *contentLab;

@end


@implementation TMXHomeIntroductModelCell

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
//        NSString *_introduce = NSLocalizedString(@"Introduce", nil);
        _nameLab.text = @"模型简介：";
        _nameLab.font = [UIFont systemFontOfSize:12];
        _nameLab.textColor = RGBColor(64, 64, 64);
    }
    return _nameLab;
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab=[UILabel new];
        _contentLab.font = [UIFont systemFontOfSize:12];
        _contentLab.textColor = RGBColor(64, 64, 64);
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)initUI{

    [self addSubview:self.nameLab];
    [self addSubview:self.contentLab];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.top.equalTo(weakSelf.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(65, 15));
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLab.mas_right);
        make.top.equalTo(_nameLab.mas_top);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-20);
    }];
}

#pragma mark - setter getter
-(void)setModelInfo:(NSString *)modelInfo
{
    _modelInfo = modelInfo;
    _contentLab.text = modelInfo;
}

@end
