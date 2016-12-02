//
//  TMXPrinterControlView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterControlView.h"

@interface TMXPrinterControlView ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *centerView;

@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIButton *threeBtn;
@property (nonatomic, strong) UIButton *fourBtn;

@property (nonatomic, strong) UIButton *enterWireBtn;
@property (nonatomic, strong) UIButton *exitWireBtn;

@property (nonatomic, strong) UIButton *zPlusBtn;
@property (nonatomic, strong) UIButton *zMinusBtn;

@property (nonatomic, strong) UIButton *yPlusBtn;
@property (nonatomic, strong) UIButton *yMinusBtn;
@property (nonatomic, strong) UIButton *xPlusBtn;
@property (nonatomic, strong) UIButton *xMinusBtn;
@property (nonatomic, strong) UIButton *homeBtn;

@property (nonatomic, strong) UIButton *balanceBtn;
@property (nonatomic, strong) UIButton *pauseBtn;
@property (nonatomic, strong) UIButton *upLoadLogBtn;

@property (nonatomic, strong) UILabel *stepLab;
@property (nonatomic, strong) UILabel *controlTemperature;
@property (nonatomic, strong) UILabel *showCurrentTemperature;
@property (nonatomic, strong) UILabel *maxCurrentTemperature;
@property (nonatomic, strong) UISlider *temperaturePro;
@end

@implementation TMXPrinterControlView

#pragma mark <getter setter>
-(UILabel *)stepLab
{
    if (!_stepLab) {
        _stepLab = [UILabel new];
        _stepLab.text = @"单步距离";
        _stepLab.textAlignment = NSTextAlignmentCenter;
        _stepLab.font = [UIFont systemFontOfSize:14];
    }
    return _stepLab;
}

-(UIView *)topView{
    if (!_topView) {
        _topView=[UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

-(UIView *)leftView{
    if (!_leftView) {
        _leftView=[UIView new];
        _leftView.backgroundColor = [UIColor whiteColor];
    }
    return _leftView;
}

-(UIView *)rightView{
    if (!_rightView) {
        _rightView=[UIView new];
        _rightView.backgroundColor = [UIColor whiteColor];
    }
    return _rightView;
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView=[UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

-(UIView *)centerView{
    if (!_centerView) {
        _centerView=[UIView new];
        _centerView.backgroundColor = [UIColor whiteColor];
    }
    return _centerView;
}


-(UIButton *)oneBtn{
    if (!_oneBtn) {
        _oneBtn=[UIButton buttonWithType:0];
        _oneBtn.tag = 1;
        [_oneBtn setImage:[UIImage imageNamed:@"0.1mm_normal"] forState:UIControlStateNormal];
        [_oneBtn setImage:[UIImage imageNamed:@"0.1mm_select"] forState:UIControlStateHighlighted];
        [_oneBtn addTarget:self action:@selector(btnLength:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _oneBtn;
}

-(UIButton *)twoBtn{
    if (!_twoBtn) {
        _twoBtn=[UIButton buttonWithType:0];
        _twoBtn.tag = 2;
        [_twoBtn setImage:[UIImage imageNamed:@"1mm_normal"] forState:UIControlStateNormal];
        [_twoBtn setImage:[UIImage imageNamed:@"1mm_select"] forState:UIControlStateHighlighted];
        [_twoBtn addTarget:self action:@selector(btnLength:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _twoBtn;
}

-(UIButton *)threeBtn{
    if (!_threeBtn) {
        _threeBtn=[UIButton buttonWithType:0];
        _threeBtn.tag = 3;
        [_threeBtn setImage:[UIImage imageNamed:@"10mm_normal"] forState:UIControlStateNormal];
        [_threeBtn setImage:[UIImage imageNamed:@"10mm_select"] forState:UIControlStateHighlighted];
        [_threeBtn addTarget:self action:@selector(btnLength:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _threeBtn;
}

-(UIButton *)fourBtn{
    if (!_fourBtn) {
        _fourBtn=[UIButton buttonWithType:0];
        _fourBtn.tag = 4;
        [_fourBtn setImage:[UIImage imageNamed:@"100mm_normal"] forState:UIControlStateNormal];
        [_fourBtn setImage:[UIImage imageNamed:@"100mm_select"] forState:UIControlStateHighlighted];
        [_fourBtn addTarget:self action:@selector(btnLength:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fourBtn;
}

-(UIButton *)enterWireBtn{
    if (!_enterWireBtn) {
        _enterWireBtn=[UIButton buttonWithType:0];
        _enterWireBtn.tag = 1;
        [_enterWireBtn setImage:[UIImage imageNamed:@"ExtrudeTop_normal"] forState:UIControlStateNormal];
        [_enterWireBtn setImage:[UIImage imageNamed:@"ExtrudeTop_select"] forState:UIControlStateHighlighted];
        [_enterWireBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enterWireBtn;
}

-(UIButton *)exitWireBtn{
    if (!_exitWireBtn) {
        _exitWireBtn=[UIButton buttonWithType:0];
        [_exitWireBtn setImage:[UIImage imageNamed:@"ExtrudeBottom_normal"] forState:UIControlStateNormal];
        [_exitWireBtn setImage:[UIImage imageNamed:@"ExtrudeBottom_select"] forState:UIControlStateHighlighted];
        _exitWireBtn.tag = 2;
        [_exitWireBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitWireBtn;
}

-(UIButton *)zPlusBtn{
    if (!_zPlusBtn) {
        _zPlusBtn=[UIButton buttonWithType:0];
        [_zPlusBtn setImage:[UIImage imageNamed:@"z+_normal"] forState:UIControlStateNormal];
        [_zPlusBtn setImage:[UIImage imageNamed:@"z+_select"] forState:UIControlStateHighlighted];
        _zPlusBtn.tag = 3;
        [_zPlusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zPlusBtn;
}

-(UIButton *)zMinusBtn{
    if (!_zMinusBtn) {
        _zMinusBtn=[UIButton buttonWithType:0];
        [_zMinusBtn setImage:[UIImage imageNamed:@"z-_normal"] forState:UIControlStateNormal];
        [_zMinusBtn setImage:[UIImage imageNamed:@"z-_select"] forState:UIControlStateHighlighted];
        _zMinusBtn.tag = 4;
        [_zMinusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zMinusBtn;
}

-(UIButton *)yPlusBtn{
    if (!_yPlusBtn) {
        _yPlusBtn=[UIButton buttonWithType:0];
        [_yPlusBtn setImage:[UIImage imageNamed:@"y+_normal"] forState:UIControlStateNormal];
        [_yPlusBtn setImage:[UIImage imageNamed:@"y+_select"] forState:UIControlStateHighlighted];
        _yPlusBtn.tag = 6;
        [_yPlusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yPlusBtn;
}

-(UIButton *)yMinusBtn{
    if (!_yMinusBtn) {
        _yMinusBtn=[UIButton buttonWithType:0];
        [_yMinusBtn setImage:[UIImage imageNamed:@"y-_normal"] forState:UIControlStateNormal];
        [_yMinusBtn setImage:[UIImage imageNamed:@"y-_select"] forState:UIControlStateHighlighted];
        _yMinusBtn.tag = 5;
        [_yMinusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yMinusBtn;
}

-(UIButton *)xPlusBtn{
    if (!_xPlusBtn) {
        _xPlusBtn=[UIButton buttonWithType:0];
        [_xPlusBtn setImage:[UIImage imageNamed:@"x+_normal"] forState:UIControlStateNormal];
        [_xPlusBtn setImage:[UIImage imageNamed:@"x+_select"] forState:UIControlStateHighlighted];
        _xPlusBtn.tag = 8;
        [_xPlusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _xPlusBtn;
}

-(UIButton *)xMinusBtn{
    if (!_xMinusBtn) {
        _xMinusBtn=[UIButton buttonWithType:0];
        [_xMinusBtn setImage:[UIImage imageNamed:@"x-_normal"] forState:UIControlStateNormal];
        [_xMinusBtn setImage:[UIImage imageNamed:@"x-_select"] forState:UIControlStateHighlighted];
        _xMinusBtn.tag = 7;
        [_xMinusBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _xMinusBtn;
}

-(UIButton *)homeBtn{
    if (!_homeBtn) {
        _homeBtn=[UIButton buttonWithType:0];
        [_homeBtn setImage:[UIImage imageNamed:@"HomeControl_normal"] forState:UIControlStateNormal];
        [_homeBtn setImage:[UIImage imageNamed:@"HomeControl_select"] forState:UIControlStateHighlighted];
        _homeBtn.tag = 9;
        [_homeBtn addTarget:self action:@selector(setHomeEven:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _homeBtn;
}

-(UIButton *)balanceBtn{
    if (!_balanceBtn) {
        _balanceBtn=[UIButton buttonWithType:0];
        [_balanceBtn setImage:[UIImage imageNamed:@"Level_normal"] forState:UIControlStateNormal];
        [_balanceBtn setImage:[UIImage imageNamed:@"Level_select"] forState:UIControlStateHighlighted];
        _balanceBtn.tag = 1;
        [_balanceBtn addTarget:self action:@selector(bottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _balanceBtn;
}

-(UIButton *)pauseBtn{
    if (!_pauseBtn) {
        _pauseBtn=[UIButton buttonWithType:0];
        [_pauseBtn setImage:[UIImage imageNamed:@"ImmeStop_normal"] forState:UIControlStateNormal];
        [_pauseBtn setImage:[UIImage imageNamed:@"ImmeStop_select"] forState:UIControlStateHighlighted];
        _pauseBtn.tag = 2;
        [_pauseBtn addTarget:self action:@selector(bottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pauseBtn;
}

-(UIButton *)upLoadLogBtn{
    if (!_upLoadLogBtn) {
        _upLoadLogBtn=[UIButton buttonWithType:0];
        [_upLoadLogBtn setImage:[UIImage imageNamed:@"UpoadLog_normal"] forState:UIControlStateNormal];
        [_upLoadLogBtn setImage:[UIImage imageNamed:@"UpoadLog_select"] forState:UIControlStateHighlighted];
        _upLoadLogBtn.tag = 3;
        [_upLoadLogBtn addTarget:self action:@selector(bottomBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upLoadLogBtn;
}

-(UILabel *)controlTemperature{
    if (!_controlTemperature) {
        _controlTemperature=[UILabel new];
        _controlTemperature.text = @"调节设备温度：";
        _controlTemperature.font = [UIFont systemFontOfSize:14];
    }
    return _controlTemperature;
}

-(UILabel *)showCurrentTemperature{
    if (!_showCurrentTemperature) {
        _showCurrentTemperature=[UILabel new];
        _showCurrentTemperature.text = @"120.00";
        _showCurrentTemperature.font = [UIFont systemFontOfSize:14];
        _showCurrentTemperature.textColor = systemColor;
    }
    return _showCurrentTemperature;
}

-(UILabel *)maxCurrentTemperature{
    if (!_maxCurrentTemperature) {
        _maxCurrentTemperature=[UILabel new];
        _maxCurrentTemperature.text = @"230.00";
        _maxCurrentTemperature.textColor = systemColor;
        _maxCurrentTemperature.textAlignment = NSTextAlignmentRight;
        _maxCurrentTemperature.font = [UIFont systemFontOfSize:14];
    }
    return _maxCurrentTemperature;
}

-(UISlider *)temperaturePro{
    if (!_temperaturePro) {
        _temperaturePro = [[UISlider alloc] init];
        _temperaturePro.value = 50;
        _temperaturePro.backgroundColor = [UIColor whiteColor];
        [_temperaturePro addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _temperaturePro;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}


-(void)initUI{
    [self addSubview:self.stepLab];
    
    [self addSubview:self.topView];
    [_topView addSubview:self.oneBtn];
    [_topView addSubview:self.twoBtn];
    [_topView addSubview:self.threeBtn];
    [_topView addSubview:self.fourBtn];
    
    [self addSubview:self.leftView];
    [_leftView addSubview:self.enterWireBtn];
    [_leftView addSubview:self.exitWireBtn];
    
    [self addSubview:self.rightView];
    [_rightView addSubview:self.zPlusBtn];
    [_rightView addSubview:self.zMinusBtn];
    
    [self addSubview:self.centerView];
    [_centerView addSubview:self.yMinusBtn];
    [_centerView addSubview:self.yPlusBtn];
    [_centerView addSubview:self.xPlusBtn];
    [_centerView addSubview:self.xMinusBtn];
    [_centerView addSubview:self.homeBtn];
    
    [self addSubview:self.bottomView];
    [_bottomView addSubview:self.balanceBtn];
    [_bottomView addSubview:self.pauseBtn];
    [_bottomView addSubview:self.upLoadLogBtn];
    
    [self addSubview:self.controlTemperature];
    [self addSubview:self.showCurrentTemperature];
    [self addSubview:self.maxCurrentTemperature];
    [self addSubview:self.temperaturePro];
}


-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    [_stepLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.bottom.equalTo(_topView.mas_top).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    
    //topView
    [_topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_centerView.mas_top).with.offset(-30);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(320, 40));
    }];
    
    [_oneBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.left.equalTo(_topView.mas_left);
        make.width.mas_equalTo(@(80));
    }];
    
    [_twoBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_oneBtn.mas_right);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.width.mas_equalTo(@(80));
    }];
    
    [_threeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_twoBtn.mas_right);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.width.mas_equalTo(@(80));
    }];
    
    [_fourBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_topView.mas_right);
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topView.mas_bottom);
        make.width.mas_equalTo(@(80));
    }];
    
    
    //centerView
    [_centerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY).with.offset(-30);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(240, 240));
    }];
    
    [_yMinusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_centerView.mas_left).with.offset(45);
        make.right.equalTo(_centerView.mas_right).with.offset(-45);
        make.top.equalTo(_centerView.mas_top);
        make.height.mas_equalTo(@(70));
    }];
    
    [_yPlusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_yMinusBtn.mas_left);
        make.right.equalTo(_yMinusBtn.mas_right);
        make.bottom.equalTo(_centerView.mas_bottom);
        make.height.mas_equalTo(@(70));
    }];
    
    [_xMinusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_centerView.mas_left);
        make.top.equalTo(_centerView.mas_top).with.offset(45);
        make.bottom.equalTo(_centerView.mas_bottom).with.offset(-45);
        make.width.mas_equalTo(@(70));
    }];
    [_xPlusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_centerView.mas_right);
        make.top.equalTo(_xMinusBtn.mas_top);
        make.bottom.equalTo(_xMinusBtn.mas_bottom);
        make.width.mas_equalTo(@(70));
    }];
    
    [_homeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_centerView.mas_centerX);
        make.centerY.equalTo(_centerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    
    //leftView
    [_leftView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_centerView.mas_centerY);
        make.right.equalTo(_centerView.mas_left).with.offset(-60);
        make.size.mas_equalTo(CGSizeMake(70, 160));
    }];
    
    [_enterWireBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftView.mas_centerX);
        make.top.equalTo(_leftView.mas_top);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    [_exitWireBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftView.mas_centerX);
        make.bottom.equalTo(_leftView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    
    //rightView
    [_rightView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_centerView.mas_centerY);
        make.left.equalTo(_centerView.mas_right).with.offset(60);
        make.size.mas_equalTo(CGSizeMake(70, 160));
    }];
    
    [_zPlusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rightView.mas_centerX);
        make.top.equalTo(_rightView.mas_top);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    [_zMinusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rightView.mas_centerX);
        make.bottom.equalTo(_rightView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    
    //bottomView
    [_bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_centerView.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(240, 60));
    }];
    
    [_balanceBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomView.mas_left);
        make.centerY.equalTo(_bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_pauseBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bottomView.mas_centerX);
        make.centerY.equalTo(_bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_upLoadLogBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bottomView.mas_right);
        make.centerY.equalTo(_bottomView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_controlTemperature mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left);
        make.top.equalTo(_bottomView.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    
    [_showCurrentTemperature mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_controlTemperature.mas_right).with.offset(10);
        make.top.equalTo(_bottomView.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_maxCurrentTemperature mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_rightView.mas_right);
        make.top.equalTo(_bottomView.mas_bottom).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    
    [_temperaturePro mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_controlTemperature.mas_left);
        make.top.equalTo(_controlTemperature.mas_bottom).with.offset(5);
        make.right.equalTo(_rightView.mas_right);
        make.height.mas_equalTo(@(20));
    }];

}

//0.1,1,10,100mm
- (void)btnLength:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topBtn:)]) {
        [self.delegate topBtn:sender.tag];
    }
}

//x,y,z
- (void)setHomeEven:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBtn:)]) {
        [self.delegate clickBtn:sender.tag];
    }
}

//调平
- (void)bottomBtn:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(bottomBtn:)]) {
        [self.delegate bottomBtn:sender.tag];
    }
}

//温度调节
- (void)sliderValueChange:(UISlider *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(temChange:)]) {
        [self.delegate temChange:sender];
    }
}

@end
