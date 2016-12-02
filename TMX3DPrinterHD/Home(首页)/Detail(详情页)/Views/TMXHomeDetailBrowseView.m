//
//  TMXHomeDetailBrowseView.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeDetailBrowseView.h"

@interface TMXHomeDetailBrowseView ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *backGround;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *browseTipLab;
@property (nonatomic, strong) UILabel *browseLab;
@end

@implementation TMXHomeDetailBrowseView

-(UIView *)backGround
{
    if (!_backGround) {
        _backGround = [UIView new];
        _backGround.backgroundColor = [UIColor whiteColor];
    }
    return _backGround;
}

-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.layer.cornerRadius = 5;
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderWidth = 1;
        _backView.layer.borderColor = RGBColor(246, 246, 246).CGColor;
    }
    return _backView;
}

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"BrowseIcon"];
    }
    return _icon;
}

-(UIView *)line{
    if (!_line) {
        _line=[UIView new];
        _line.backgroundColor = RGBColor(245, 176, 128);
    }
    return _line;
}

-(UILabel *)browseTipLab{
    if (!_browseTipLab) {
        _browseTipLab=[UILabel new];
//        NSString *_browse = NSLocalizedString(@"Browse", nil);
        _browseTipLab.text = @"浏览次数";
        _browseTipLab.textAlignment = NSTextAlignmentCenter;
        _browseTipLab.font = [UIFont systemFontOfSize:8];
    }
    return _browseTipLab;
}

-(UILabel *)browseLab{
    if (!_browseLab) {
        _browseLab=[UILabel new];
        _browseLab.textColor = RGBColor(234, 97, 1);
        _browseLab.textAlignment = NSTextAlignmentCenter;
        _browseLab.font = [UIFont systemFontOfSize:8];
        
    }
    return _browseLab;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}


-(void)initUI{
    
    [self addSubview:self.backGround];
    [self.backGround addSubview:self.backView];
    [self.backView addSubview:self.icon];
    [self.backView addSubview:self.line];
    [self.backView addSubview:self.browseTipLab];
    [self.backView addSubview:self.browseLab];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    [_backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_backGround.mas_centerX);
        make.centerY.equalTo(_backGround.mas_centerY);
        make.top.equalTo(_backGround.mas_top).with.offset(10);
        make.bottom.equalTo(_backGround.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(@(75));
    }];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView.mas_left).with.offset(5);
        make.centerY.equalTo(_backView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(17, 12));
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.top.equalTo(_backView.mas_top).with.offset(7);
        make.bottom.equalTo(_backView.mas_bottom).with.offset(-7);
        make.width.mas_equalTo(@(1));
    }];
    
    [_browseTipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line.mas_right);
        make.centerY.equalTo(_backView.mas_centerY).with.offset(-5);
        make.right.equalTo(_backView.mas_right);
        make.height.mas_equalTo(@(15));
    }];
    
    [_browseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line.mas_right);
        make.centerY.equalTo(_backView.mas_centerY).with.offset(5);
        make.right.equalTo(_backView.mas_right);
        make.height.mas_equalTo(@(15));
    }];
}

//#pragma mark - setter getter
-(void)setBrowseCount:(NSInteger)browseCount
{
    _browseCount = browseCount;
//    NSString *count = NSLocalizedString(@"Num", nil);
    _browseLab.text = [NSString stringWithFormat:@"%ld次", browseCount];
    [NSString labelString:_browseLab font:[UIFont systemFontOfSize:8] range:NSMakeRange(_browseLab.text.length-1, 1) color:RGBColor(124, 124, 124)];
}

@end
