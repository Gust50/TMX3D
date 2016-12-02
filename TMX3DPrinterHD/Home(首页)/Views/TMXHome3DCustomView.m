//
//  TMXHome3DCustomView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/24.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHome3DCustomView.h"

@interface TMXHome3DCustomView ()
@property (nonatomic, strong) UILabel *mainTitleLab;
@property (nonatomic, strong) UILabel *subTitleLab;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *backGround;
@end

@implementation TMXHome3DCustomView
#pragma mark <lazyLoad>
-(UILabel *)mainTitleLab{
    if (!_mainTitleLab) {
        _mainTitleLab=[UILabel new];
        _mainTitleLab.textAlignment=NSTextAlignmentCenter;
        _mainTitleLab.font=[UIFont systemFontOfSize:16];
    }
    return _mainTitleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab=[UILabel new];
        _subTitleLab.textAlignment=NSTextAlignmentCenter;
        _subTitleLab.font=[UIFont systemFontOfSize:12];
        _subTitleLab.numberOfLines=0;
    }
    return _subTitleLab;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[UIImageView new];
        
    }
    return _imageView;
}

-(UIView *)backGround{
    if (!_backGround) {
        _backGround=[UIView new];
        _backGround.backgroundColor=backGroundColor;
    }
    return _backGround;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.mainTitleLab];
    [self addSubview:self.subTitleLab];
    [self addSubview:self.imageView];
    [self addSubview:self.backGround];
}


-(void)updateConstraints{
    
    [super updateConstraints];
    WS(weakSelf);
    
    [_mainTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.mas_top).with.offset(20);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(@(15));
    }];
    
    if (Lanscape) {
        [_subTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_mainTitleLab.mas_bottom).with.offset(10);
            make.left.equalTo(weakSelf.mas_left);
            make.right.equalTo(weakSelf.mas_right);
            make.height.mas_equalTo(@(15));
        }];
    }else{
        [_subTitleLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_mainTitleLab.mas_bottom).with.offset(10);
            make.left.equalTo(weakSelf.mas_left);
            make.right.equalTo(weakSelf.mas_right);
            make.height.mas_equalTo(@(40));
        }];
    }
    
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_backGround.mas_top).offset(-10);
        make.top.equalTo(_subTitleLab.mas_bottom).offset(10);
        make.width.mas_equalTo(@(120));
        make.centerX.equalTo(weakSelf.mas_centerX);
        
    }];
    
    [_backGround mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.mas_equalTo(@(20));
    }];
    
}

#pragma mark <getter setter>
-(void)setMainTitleText:(NSString *)mainTitleText{
    _mainTitleLab.text=mainTitleText;
}
-(void)setSubTitleText:(NSString *)subTitleText{
    _subTitleLab.text=subTitleText;
}
-(void)setIconUrlText:(NSString *)iconUrlText{
    _imageView.image = [UIImage imageNamed:iconUrlText];
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)setColor:(UIColor *)color
{
    _mainTitleLab.textColor = color;
}

@end
