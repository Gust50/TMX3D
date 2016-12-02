//
//  TMXDetailLeftJqueryHeader.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXDetailLeftJqueryHeader.h"
#import "KBJquery.h"

@interface TMXDetailLeftJqueryHeader ()<KBJqueryDelegate>
@property (nonatomic, strong) KBJquery *kBJquery;    ///<轮播
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *describe;
@property (nonatomic, strong) UIImageView *restore;
@end

@implementation TMXDetailLeftJqueryHeader

-(UIImageView *)restore
{
    if (!_restore) {
        _restore = [UIImageView new];
        _restore.image = [UIImage imageNamed:@"WaitResore"];
    }
    return _restore;
}

-(KBJquery *)kBJquery{
    if (!_kBJquery) {
        _kBJquery=[[KBJquery alloc] initWithFrame:self.frame];
        _kBJquery.duration=5;
        _kBJquery.isWebImage=YES;
        _kBJquery.delegate = self;
    }
    return _kBJquery;
}

-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = RGBAColor(0, 0, 0, 0.2);
    }
    return _bottomView;
}

-(UILabel *)describe
{
    if (!_describe) {
        _describe = [UILabel new];
        _describe.text = @"小黄人";
        _describe.font = [UIFont systemFontOfSize:14];
        _describe.textColor = [UIColor whiteColor];
    }
    return _describe;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.kBJquery];
    [self.kBJquery addSubview:self.restore];
    [self.kBJquery addSubview:self.bottomView];
    [self.bottomView addSubview:self.describe];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    [_kBJquery mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_restore mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_kBJquery.mas_top);
        make.left.equalTo(_kBJquery.mas_left);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_kBJquery.mas_bottom);
        make.left.equalTo(_kBJquery.mas_left);
        make.right.equalTo(_kBJquery.mas_right);
        make.height.mas_equalTo(@(40));
    }];
    
    [_describe mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bottomView.mas_bottom);
        make.left.equalTo(_bottomView.mas_left).with.offset(15);
        make.right.equalTo(_bottomView.mas_right).with.offset(-15);
        make.top.equalTo(_bottomView.mas_top);
    }];
    
}

#pragma mark - setter getter
-(void)setJqueryArray:(NSArray *)jqueryArray
{
    [_kBJquery updateUI:self.frame];
    
    _jqueryArray = jqueryArray;
    _kBJquery.imageArray = jqueryArray;
    
    [self updateConstraints];
}

-(void)setModelName:(NSString *)modelName
{
    _modelName = modelName;
    _describe.text = modelName;
}

@end
