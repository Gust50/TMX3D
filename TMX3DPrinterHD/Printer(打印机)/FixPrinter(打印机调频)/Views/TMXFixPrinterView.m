//
//  TMXFixPrinterView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFixPrinterView.h"
#import "UIImage+GIF.h"

@interface TMXFixPrinterView ()
{
    NSString *gifName;
}

@property (nonatomic, strong) UILabel *indicatorLab;
@property (nonatomic, strong) UIImageView *indicatorImg;

@property (nonatomic, strong) UIView *fixView;
@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIButton *threeBtn;
@property (nonatomic, strong) UIButton *fourBtn;

@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation TMXFixPrinterView

-(UILabel *)indicatorLab{
    if (!_indicatorLab) {
        _indicatorLab=[UILabel new];
        _indicatorLab.font = [UIFont systemFontOfSize:16];
        _indicatorLab.textAlignment = NSTextAlignmentCenter;
        _indicatorLab.text = @"请放一张A4纸到平台";
    }
    return _indicatorLab;
}

-(UIImageView *)indicatorImg{
    if (!_indicatorImg) {
        _indicatorImg=[UIImageView new];
//        _indicatorImg.image = [UIImage imageNamed:@"Juggle_normal"];
    }
    return _indicatorImg;
}

-(UIView *)fixView{
    if (!_fixView) {
        _fixView=[UIView new];
    }
    return _fixView;
}
-(UIButton *)oneBtn{
    if (!_oneBtn) {
        _oneBtn=[UIButton buttonWithType:0];
        _oneBtn.layer.cornerRadius = 5;
        _oneBtn.layer.masksToBounds = YES;
        _oneBtn.backgroundColor = systemColor;
        _oneBtn.tag=101;
        _oneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_oneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_oneBtn setTitle:@"向下0.1mm" forState:UIControlStateNormal];
    }
    return _oneBtn;
}

-(UIButton *)twoBtn{
    if (!_twoBtn) {
        _twoBtn=[UIButton buttonWithType:0];
        _twoBtn.layer.cornerRadius = 5;
        _twoBtn.layer.masksToBounds = YES;
        _twoBtn.backgroundColor = systemColor;
        _twoBtn.tag=102;
        _twoBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_twoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_twoBtn setTitle:@"向上0.1mm" forState:UIControlStateNormal];
    }
    return _twoBtn;
}

-(UIButton *)threeBtn{
    if (!_threeBtn) {
        _threeBtn=[UIButton buttonWithType:0];
        _threeBtn.layer.cornerRadius = 5;
        _threeBtn.layer.masksToBounds = YES;
        _threeBtn.backgroundColor = [UIColor blueColor];
        _threeBtn.backgroundColor = systemColor;
        _threeBtn.tag=103;
        _threeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_threeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_threeBtn setTitle:@"向下1.0mm" forState:UIControlStateNormal];
    }
    return _threeBtn;
}

-(UIButton *)fourBtn{
    if (!_fourBtn) {
        _fourBtn=[UIButton buttonWithType:0];
        _fourBtn.layer.cornerRadius = 5;
        _fourBtn.layer.masksToBounds = YES;
        _fourBtn.backgroundColor = systemColor;
        _fourBtn.tag=104;
        _fourBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_fourBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_fourBtn setTitle:@"向上1.0mm" forState:UIControlStateNormal];
    }
    return _fourBtn;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn=[UIButton buttonWithType:0];
        _nextBtn.layer.cornerRadius = 5;
        _nextBtn.layer.masksToBounds = YES;
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _nextBtn.backgroundColor=systemColor;
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(touchNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.indicatorLab];
    [self addSubview:self.indicatorImg];
    [self addSubview:self.fixView];
    [_fixView addSubview:self.oneBtn];
    [_fixView addSubview:self.twoBtn];
    [_fixView addSubview:self.threeBtn];
    [_fixView addSubview:self.fourBtn];
    [self addSubview:self.nextBtn];
}


-(void)touchFixBtn:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickFixBtn:)]) {
        [self.delegate clickFixBtn:btn];
    }
}

-(void)touchNextBtn:(UIButton *)btn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickNextBtn)]) {
        
        [self.delegate clickNextBtn];
    }
}


-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_indicatorLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf.mas_top).with.offset(64);
        make.height.mas_equalTo(@(40));
    }];
    
    [_indicatorImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_indicatorLab.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).with.offset(20);
        make.right.equalTo(weakSelf.mas_right).with.offset(-20);
        make.bottom.equalTo(_fixView.mas_top).with.offset(-20);
    }];
    
    [_fixView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(_nextBtn.mas_top).with.offset(-20);
        make.height.mas_equalTo(@(100));
    }];
    
    [_oneBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fixView.mas_left).with.offset(10);
        make.right.equalTo(_fixView.mas_centerX).with.offset(-10);
        make.top.equalTo(_fixView.mas_top).with.offset(10);
        make.bottom.equalTo(_fixView.mas_centerY).with.offset(-5);
    }];
    
    [_twoBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fixView.mas_centerX).with.offset(10);
        make.right.equalTo(_fixView.mas_right).with.offset(-10);
        make.top.equalTo(_fixView.mas_top).with.offset(10);
        make.bottom.equalTo(_fixView.mas_centerY).with.offset(-5);
    }];
    
    [_threeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fixView.mas_left).with.offset(10);
        make.right.equalTo(_fixView.mas_centerX).with.offset(-10);
        make.top.equalTo(_fixView.mas_centerY).with.offset(5);
        make.bottom.equalTo(_fixView.mas_bottom).with.offset(-10);
    }];
    
    [_fourBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fixView.mas_centerX).with.offset(10);
        make.right.equalTo(_fixView.mas_right).with.offset(-10);
        make.top.equalTo(_fixView.mas_centerY).with.offset(5);
        make.bottom.equalTo(_fixView.mas_bottom).with.offset(-10);
    }];
    
    
    [_nextBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-30);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(40));
    }];
}

#pragma mark - setter getter
-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    _indicatorImg.image = [UIImage sd_animatedGIFNamed:imageName];
}

- (void)setIsHide:(BOOL)isHide
{
    _isHide = isHide;
    _fixView.hidden = isHide;
    if (isHide) {
        _indicatorLab.text = @"请放一张A4纸到平台";
        _indicatorImg.image = [UIImage sd_animatedGIFNamed:@"printerInit"];
    }else
    {
        _indicatorLab.text = @"确认纸张可以移动并和喷头有接触";
        _indicatorImg.image = [UIImage sd_animatedGIFNamed:self.imageName];
    }
}

@end
