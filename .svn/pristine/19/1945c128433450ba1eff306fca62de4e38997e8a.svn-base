//
//  TMXHomeScrollView3DCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/24.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeScrollView3DCell.h"
#import "TMXHome3DCustomView.h"

@interface TMXHomeScrollView3DCell ()
@property (nonatomic, strong) TMXHome3DCustomView *juggleBtn;
@property (nonatomic, strong) TMXHome3DCustomView *modelBtn;
@property (nonatomic, strong) TMXHome3DCustomView *designBtn;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@end

@implementation TMXHomeScrollView3DCell

-(TMXHome3DCustomView *)juggleBtn{
    if (!_juggleBtn) {
        _juggleBtn=[TMXHome3DCustomView new];
        _juggleBtn.mainTitleText=@"3D积木工坊";
        _juggleBtn.color = RGBColor(61, 180, 90);
        _juggleBtn.subTitleText=@"随意堆积木头,堆出你的新世界";
        _juggleBtn.iconUrlText = @"Juggle_normal";
        
    }
    return _juggleBtn;
}

-(TMXHome3DCustomView *)modelBtn{
    if (!_modelBtn) {
        _modelBtn=[TMXHome3DCustomView new];
        _modelBtn.mainTitleText=@"CAD建模";
        _modelBtn.color = RGBColor(248, 76, 32);
        _modelBtn.subTitleText=@"思维+创意三维设计,开始你的3D之旅";
        _modelBtn.iconUrlText = @"Model_normal";
    }
    return _modelBtn;
}

-(TMXHome3DCustomView *)designBtn{
    if (!_designBtn) {
        _designBtn=[TMXHome3DCustomView new];
        _designBtn.mainTitleText=@"创意手绘";
        _designBtn.color = RGBColor(29, 187, 235);
        _designBtn.subTitleText=@"随意画出3D立体图形,绘出新乐趣";
        _designBtn.iconUrlText = @"Design_normal";
    }
    return _designBtn;
}

-(UIView *)leftView
{
    if (!_leftView) {
        _leftView = [UIView new];
        _leftView.backgroundColor = backGroundColor;
    }
    return _leftView;
}

-(UIView *)rightView
{
    if (!_rightView) {
        _rightView = [UIView new];
        _rightView.backgroundColor = backGroundColor;
    }
    return _rightView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.juggleBtn];
    [self addSubview:self.modelBtn];
    [self addSubview:self.designBtn];
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_juggleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.mas_equalTo(@(weakSelf.width/3));
    }];
    
    [_leftView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_juggleBtn.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.mas_equalTo(@(1));
    }];
    
    [_modelBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.mas_equalTo(@(weakSelf.width/3));
    }];
    
    [_designBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(weakSelf.mas_right);
        make.width.mas_equalTo(@(weakSelf.width/3));
    }];
    [_rightView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(_designBtn.mas_left);
        make.width.mas_equalTo(@(1));
    }];

}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    LRLog(@"-----------当前屏幕的改变大小-----------%@",NSStringFromCGRect(self.frame));
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
        _juggleBtn.isUpdateUI=YES;
        _modelBtn.isUpdateUI=YES;
        _designBtn.isUpdateUI=YES;
    }
}
@end
