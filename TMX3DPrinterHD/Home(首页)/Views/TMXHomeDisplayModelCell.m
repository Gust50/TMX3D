//
//  TMXHomeDisplayModelCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/24.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeDisplayModelCell.h"
#import "TMXHomeModel.h"
#import "TMXHomeClassifyListModel.h"
#import "TMXHomeSearchModel.h"
#import "TMXLikeModel.h"
#import "TMXCollectModel.h"

@interface TMXHomeDisplayModelCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *modelNameLab;
@property (nonatomic, strong) UILabel *userNameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIImageView *modelImgView;
@property (nonatomic, strong) UIButton *collectBtn;
@property (nonatomic, strong) UIButton *remarkBtn;

@end


@implementation TMXHomeDisplayModelCell

#pragma mark <lazyLoad>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.layer.cornerRadius=45.0/2;
        _icon.layer.masksToBounds=YES;
    }
    return _icon;
}

-(UILabel *)modelNameLab{
    if (!_modelNameLab) {
        _modelNameLab=[UILabel new];
        _modelNameLab.font = [UIFont systemFontOfSize:14];
    }
    return _modelNameLab;
}

-(UILabel *)userNameLab{
    if (!_userNameLab) {
        _userNameLab=[UILabel new];
        _userNameLab.font = [UIFont systemFontOfSize:12];
        _userNameLab.textColor = RGBColor(165, 165, 165);
    }
    return _userNameLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab=[UILabel new];
        _timeLab.font = [UIFont systemFontOfSize:11];
        _timeLab.textColor = [UIColor lightGrayColor];
        _timeLab.textAlignment = NSTextAlignmentRight;
    }
    return _timeLab;
}

-(UIImageView *)modelImgView{
    if (!_modelImgView) {
        _modelImgView=[UIImageView new];
    }
    return _modelImgView;
}

-(UIButton *)collectBtn{
    if (!_collectBtn) {
        _collectBtn=[UIButton new];
        [_collectBtn setImage:[UIImage imageNamed:@"Collect_normal"] forState:UIControlStateNormal];
        _collectBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_collectBtn setTitleColor:RGBColor(170, 170, 170) forState:UIControlStateNormal];
        _collectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _collectBtn.userInteractionEnabled = NO;
    }
    return _collectBtn;
}

-(UIButton *)remarkBtn{
    if (!_remarkBtn) {
        _remarkBtn=[UIButton new];
        [_remarkBtn setImage:[UIImage imageNamed:@"Remark_normal"] forState:UIControlStateNormal];
        _remarkBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_remarkBtn setTitleColor:RGBColor(170, 170, 170) forState:UIControlStateNormal];
        _remarkBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _remarkBtn.userInteractionEnabled = NO;
    }
    return _remarkBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.modelNameLab];
    [self addSubview:self.userNameLab];
    [self addSubview:self.timeLab];
    [self addSubview:self.modelImgView];
    [self addSubview:self.collectBtn];
    [self addSubview:self.remarkBtn];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(5);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [_modelNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.top.equalTo(_icon.mas_top);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(25));

    }];
    
    [_userNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.bottom.equalTo(_icon.mas_bottom);
        make.width.mas_equalTo(@(100));
        make.height.mas_equalTo(@(20));
    }];
    
    [_timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.top.equalTo(_icon.mas_centerY).with.offset(5);
        make.width.mas_equalTo(@(100));
        make.height.mas_equalTo(@(15));
    }];
    
    [_modelImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(5);
        make.right.equalTo(weakSelf.mas_right).with.offset(-5);
        make.top.equalTo(_icon.mas_bottom).with.offset(10);
        make.bottom.equalTo(_collectBtn.mas_top);
    }];
    
    [_collectBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(weakSelf.mas_centerX);
        make.height.mas_equalTo(@(30));
    }];
    
    [_remarkBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(weakSelf.mas_centerX);
        make.height.mas_equalTo(@(30));
    }];
}


-(void)setCategryListModel:(TMXHomeCategoryModelListListModel *)categryListModel
{
    _categryListModel = categryListModel;
    [self setNeedsUpdateConstraints];
    [_icon sd_setImageWithURL:[NSURL URLWithString:categryListModel.image] placeholderImage:nil];
    [_modelImgView sd_setImageWithURL:[NSURL URLWithString:categryListModel.image] placeholderImage:nil];
    _modelNameLab.text = categryListModel.name;
    _userNameLab.text = categryListModel.ownerName;
    NSString *collectL = [NSString stringWithFormat:@"%ld次收藏", categryListModel.favoriteCnt];
    [_collectBtn setTitle:collectL forState:UIControlStateNormal];
    NSString *remarkL = [NSString stringWithFormat:@"%ld次评论", categryListModel.modelCommentCount];
    [_remarkBtn setTitle:remarkL forState:UIControlStateNormal];
//    [NSString labelString:_collectLab font:[UIFont systemFontOfSize:10*AppScale] range:NSMakeRange(_collectLab.text.length-collectL.length, collectL.length) color:RGBColor(81, 81, 81)];
//    CGSize collectSize = [NSString sizeWithStr:_collectLab.text font:[UIFont systemFontOfSize:12*AppScale] width:120];
//    _collectWidth = collectSize.width;
//    NSString *remarkL = NSLocalizedString(@"Comment", nil);
//    _remarkLab.text = [NSString stringWithFormat:@"%ld%@", categryListModel.modelCommentCount, remarkL];
//    [NSString labelString:_remarkLab font:[UIFont systemFontOfSize:10*AppScale] range:NSMakeRange(_remarkLab.text.length-remarkL.length, remarkL.length) color:RGBColor(81, 81, 81)];
//    CGSize remarkSize = [NSString sizeWithStr:_remarkLab.text font:[UIFont systemFontOfSize:12*AppScale] width:120];
//    _remarkWidth = remarkSize.width;
//    
    if (categryListModel.updatedDate.length) {
        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([categryListModel.updatedDate doubleValue]/1000.0)];
            _timeLab.text = [NSDate caculatorTime:date];
    }else
    {
        _timeLab.text = @"";
    }
}

-(void)setClasifyListModel:(TMXHomeClassifyListListModel *)clasifyListModel
{
    _clasifyListModel = clasifyListModel;
    [self setNeedsUpdateConstraints];
    [_icon sd_setImageWithURL:[NSURL URLWithString:clasifyListModel.image] placeholderImage:nil];
    [_modelImgView sd_setImageWithURL:[NSURL URLWithString:clasifyListModel.image] placeholderImage:nil];
    _modelNameLab.text = clasifyListModel.name;
    _userNameLab.text = clasifyListModel.ownerName;
    NSString *collectL = [NSString stringWithFormat:@"%ld次收藏", clasifyListModel.favoriteCnt];
    [_collectBtn setTitle:collectL forState:UIControlStateNormal];
    NSString *remarkL = [NSString stringWithFormat:@"%ld次评论", clasifyListModel.modelCommentCount];
    [_remarkBtn setTitle:remarkL forState:UIControlStateNormal];
    if (clasifyListModel.updatedDate.length) {
        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([clasifyListModel.updatedDate doubleValue]/1000.0)];
        _timeLab.text = [NSDate caculatorTime:date];
    }else
    {
        _timeLab.text = @"";
    }
}

-(void)setSearchListModel:(TMXHomeSearchListModel *)searchListModel
{
    _searchListModel = searchListModel;
    [self setNeedsUpdateConstraints];
    [_icon sd_setImageWithURL:[NSURL URLWithString:searchListModel.image] placeholderImage:nil];
    [_modelImgView sd_setImageWithURL:[NSURL URLWithString:searchListModel.image] placeholderImage:nil];
    _modelNameLab.text = searchListModel.name;
    _userNameLab.text = searchListModel.ownerName;
    NSString *collectL = [NSString stringWithFormat:@"%ld次收藏", searchListModel.favoriteCnt];
    [_collectBtn setTitle:collectL forState:UIControlStateNormal];
    NSString *remarkL = [NSString stringWithFormat:@"%ld次评论", searchListModel.modelCommentCount];
    [_remarkBtn setTitle:remarkL forState:UIControlStateNormal];
    if (searchListModel.updatedDate.length) {
        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([searchListModel.updatedDate doubleValue]/1000.0)];
        _timeLab.text = [NSDate caculatorTime:date];
    }else
    {
        _timeLab.text = @"";
    }
}

-(void)setLikeListModel:(TMXLikeListModel *)likeListModel
{
    _likeListModel = likeListModel;
    [_icon sd_setImageWithURL:[NSURL URLWithString:likeListModel.image] placeholderImage:nil];
    [_modelImgView sd_setImageWithURL:[NSURL URLWithString:likeListModel.image] placeholderImage:nil];
    _modelNameLab.text = likeListModel.name;
    _userNameLab.text = likeListModel.ownerName;
    NSString *collectL = [NSString stringWithFormat:@"%ld次收藏", likeListModel.favoriteCnt];
    [_collectBtn setTitle:collectL forState:UIControlStateNormal];
    NSString *remarkL = [NSString stringWithFormat:@"%ld次评论", likeListModel.modelCommentCount];
    [_remarkBtn setTitle:remarkL forState:UIControlStateNormal];
    if (likeListModel.updatedDate.length) {
        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([likeListModel.updatedDate doubleValue]/1000.0)];
        _timeLab.text = [NSDate caculatorTime:date];
    }else
    {
        _timeLab.text = @"";
    }
    [self updateConstraints];
}

-(void)setCollectListModel:(TMXCollectListModel *)collectListModel
{
    _collectListModel = collectListModel;
    [_icon sd_setImageWithURL:[NSURL URLWithString:collectListModel.image] placeholderImage:nil];
    [_modelImgView sd_setImageWithURL:[NSURL URLWithString:collectListModel.image] placeholderImage:nil];
    _modelNameLab.text = collectListModel.name;
    _userNameLab.text = collectListModel.ownerName;
    NSString *collectL = [NSString stringWithFormat:@"%ld次收藏", collectListModel.favoriteCnt];
    [_collectBtn setTitle:collectL forState:UIControlStateNormal];
    NSString *remarkL = [NSString stringWithFormat:@"%ld次评论", collectListModel.modelCommentCount];
    [_remarkBtn setTitle:remarkL forState:UIControlStateNormal];
    if (collectListModel.updatedDate.length) {
        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([collectListModel.updatedDate doubleValue]/1000.0)];
        _timeLab.text = [NSDate caculatorTime:date];
    }else
    {
        _timeLab.text = @"";
    }
    [self updateConstraints];
}

@end
