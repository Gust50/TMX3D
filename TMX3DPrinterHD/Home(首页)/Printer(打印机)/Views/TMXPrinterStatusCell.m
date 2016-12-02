//
//  TMXPrinterStatusCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterStatusCell.h"

@interface TMXPrinterStatusCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *modelNameLab;
@property (nonatomic, strong) UILabel *showModelNameLab;
@property (nonatomic, strong) UILabel *preUseLab;
@property (nonatomic, strong) UILabel *useTimeLab;
@property (nonatomic, strong) UILabel *useMaterialLab;

@property (nonatomic, strong) UILabel *currentTemperatureLab;
@property (nonatomic, strong) UILabel *showCurrentTemperatureLab;
@property (nonatomic, strong) UILabel *maxTempratureLab;
@property (nonatomic, strong) UIProgressView *tempetaturePro;

@property (nonatomic, strong) UILabel *predictTimeLab;
@property (nonatomic, strong) UILabel *showPredictTimeLab;
@property (nonatomic, strong) UILabel *percentTimeLab;
@property (nonatomic, strong) UIProgressView *timePro;

@property (nonatomic, strong) UIButton *exchangeWireBtn;
@property (nonatomic, strong) UIButton *pauseBtn;
@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation TMXPrinterStatusCell

#pragma mark <getter setter>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"Layer"];
        _icon.backgroundColor = [UIColor redColor];
    }
    return _icon;
}

-(UILabel *)modelNameLab{
    if (!_modelNameLab) {
        _modelNameLab=[UILabel new];
        _modelNameLab.font = [UIFont systemFontOfSize:14];
        _modelNameLab.text = @"模型名称：";
    }
    return _modelNameLab;
}

-(UILabel *)showModelNameLab{
    if (!_showModelNameLab) {
        _showModelNameLab=[UILabel new];
        _showModelNameLab.font = [UIFont systemFontOfSize:14];
        _showModelNameLab.text = @"我的小黄人";
    }
    return _showModelNameLab;
}

-(UILabel *)preUseLab{
    if (!_preUseLab) {
        _preUseLab=[UILabel new];
        _preUseLab.font = [UIFont systemFontOfSize:14];
        _preUseLab.text = @"预计消耗：";
    }
    return _preUseLab;
}

-(UILabel *)useTimeLab{
    if (!_useTimeLab) {
        _useTimeLab=[UILabel new];
        _useTimeLab.font = [UIFont systemFontOfSize:14];
        _useTimeLab.text = @"耗时 04小时32分";
        _useTimeLab.textColor = systemColor;
//        [NSString labelString:_useMaterialLab font:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 2) color:[UIColor blackColor]];
    }
    return _useTimeLab;
}

-(UILabel *)useMaterialLab{
    if (!_useMaterialLab) {
        _useMaterialLab=[UILabel new];
        _useMaterialLab.font = [UIFont systemFontOfSize:14];
        _useMaterialLab.text = @"耗材 2565mm";
        _useMaterialLab.textColor = systemColor;
//        [NSString labelString:_useMaterialLab font:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 2) color:[UIColor blackColor]];
    }
    return _useMaterialLab;
}

-(UILabel *)currentTemperatureLab{
    if (!_currentTemperatureLab) {
        _currentTemperatureLab=[UILabel new];
        _currentTemperatureLab.font = [UIFont systemFontOfSize:14];
        _currentTemperatureLab.text = @"设备当前温度：";
    }
    return _currentTemperatureLab;
}

-(UILabel *)showCurrentTemperatureLab{
    if (!_showCurrentTemperatureLab) {
        _showCurrentTemperatureLab=[UILabel new];
        _showCurrentTemperatureLab.font = [UIFont systemFontOfSize:14];
        _showCurrentTemperatureLab.text = @"180.00C";
        _showCurrentTemperatureLab.textColor = systemColor;
    }
    return _showCurrentTemperatureLab;
}

-(UILabel *)maxTempratureLab{
    if (!_maxTempratureLab) {
        _maxTempratureLab=[UILabel new];
        _maxTempratureLab.font = [UIFont systemFontOfSize:16];
        _maxTempratureLab.text = @"200.00C";
        _maxTempratureLab.textColor = systemColor;
        _maxTempratureLab.textAlignment = NSTextAlignmentRight;
    }
    return _maxTempratureLab;
}

-(UILabel *)predictTimeLab{
    if (!_predictTimeLab) {
        _predictTimeLab=[UILabel new];
        _predictTimeLab.font = [UIFont systemFontOfSize:14];
        _predictTimeLab.text = @"预计剩余时间：";
    }
    return _predictTimeLab;
}

-(UILabel *)showPredictTimeLab{
    if (!_showPredictTimeLab) {
        _showPredictTimeLab=[UILabel new];
        _showPredictTimeLab.font = [UIFont systemFontOfSize:14];
        _showPredictTimeLab.text = @"03小时25分33秒";
        _showPredictTimeLab.textColor = systemColor;
    }
    return _showPredictTimeLab;
}

-(UILabel *)percentTimeLab{
    if (!_percentTimeLab) {
        _percentTimeLab=[UILabel new];
        _percentTimeLab.font = [UIFont systemFontOfSize:16];
        _percentTimeLab.text = @"24%";
        _percentTimeLab.textColor = systemColor;
        _percentTimeLab.textAlignment = NSTextAlignmentRight;
    }
    return _percentTimeLab;
}

-(UIButton *)exchangeWireBtn{
    if (!_exchangeWireBtn) {
        _exchangeWireBtn=[UIButton buttonWithType:0];
        [_exchangeWireBtn setImage:[UIImage imageNamed:@"ChangeFilament_selecct"] forState:UIControlStateNormal];
        [_exchangeWireBtn addTarget:self action:@selector(changeFilament) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exchangeWireBtn;
}

-(UIButton *)pauseBtn{
    if (!_pauseBtn) {
        _pauseBtn=[UIButton buttonWithType:0];
        [_pauseBtn setImage:[UIImage imageNamed:@"Pause_select"] forState:UIControlStateNormal];
        [_pauseBtn addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pauseBtn;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn=[UIButton buttonWithType:0];
        [_cancelBtn setImage:[UIImage imageNamed:@"PrintCenterCancel_select"] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(printCenterCancel) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(UIProgressView *)timePro
{
    if (!_timePro) {
        _timePro = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _timePro.progressTintColor = systemColor;
        _timePro.trackTintColor = [UIColor whiteColor];
        _timePro.progress = 0.5;
        _timePro.layer.cornerRadius = 7;
        _timePro.layer.masksToBounds = YES;
        _timePro.layer.borderWidth = 1;
        _timePro.layer.borderColor = systemColor.CGColor;
    }
    return _timePro;
}

-(UIProgressView *)tempetaturePro
{
    if (!_tempetaturePro) {
        _tempetaturePro = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _tempetaturePro.progressTintColor = systemColor;
        _tempetaturePro.trackTintColor = [UIColor whiteColor];
        _tempetaturePro.progress = 0.5;
        _tempetaturePro.layer.cornerRadius = 7;
        _tempetaturePro.layer.masksToBounds = YES;
        _tempetaturePro.layer.borderWidth = 1;
        _tempetaturePro.layer.borderColor = systemColor.CGColor;
    }
    return _tempetaturePro;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.modelNameLab];
    [self addSubview:self.showModelNameLab];
    [self addSubview:self.preUseLab];
    [self addSubview:self.useTimeLab];
    [self addSubview:self.useMaterialLab];
    [self addSubview:self.currentTemperatureLab];
    [self addSubview:self.showCurrentTemperatureLab];
    [self addSubview:self.maxTempratureLab];
    [self addSubview:self.tempetaturePro];
    [self addSubview:self.predictTimeLab];
    [self addSubview:self.showPredictTimeLab];
    [self addSubview:self.percentTimeLab];
    [self addSubview:self.timePro];
    [self addSubview:self.exchangeWireBtn];
    [self addSubview:self.pauseBtn];
    [self addSubview:self.cancelBtn];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    [_modelNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(15);
        make.top.equalTo(_icon.mas_top).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(75, 15));
    }];
    
    [_showModelNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelNameLab.mas_right);
        make.right.equalTo(_exchangeWireBtn.mas_left).with.offset(-10);
        make.top.equalTo(_icon.mas_top).with.offset(5);
        make.height.mas_equalTo(@(15));
    }];
    
    [_preUseLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(15);
        make.top.equalTo(_modelNameLab.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(75, 15));
    }];
    
    [_useTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_preUseLab.mas_right);
        make.top.equalTo(_preUseLab.mas_top);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
    
    [_useMaterialLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_useTimeLab.mas_right).with.offset(5);
        make.top.equalTo(_preUseLab.mas_top);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
    
    [_currentTemperatureLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(15);
        make.bottom.equalTo(_tempetaturePro.mas_top).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(110, 15));
    }];
    
    [_showCurrentTemperatureLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_currentTemperatureLab.mas_right);
        make.right.equalTo(_maxTempratureLab.mas_left).with.offset(-5);
        make.bottom.equalTo(_tempetaturePro.mas_top).with.offset(-5);
        make.height.mas_equalTo(@(15));
    }];
    
    [_maxTempratureLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_tempetaturePro.mas_right).with.offset(-5);
        make.bottom.equalTo(_tempetaturePro.mas_top).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(150, 15));
    }];
    
    [_tempetaturePro mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(_pauseBtn.mas_left).with.offset(-80);
        make.bottom.equalTo(_predictTimeLab.mas_top).with.offset(-15);
        make.height.mas_equalTo(@(15));
    }];
    
    
    [_predictTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(15);
        make.bottom.equalTo(_timePro.mas_top).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(110, 15));
    }];
    
    [_showPredictTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_predictTimeLab.mas_right);
        make.right.equalTo(_percentTimeLab.mas_left).with.offset(-5);
        make.bottom.equalTo(_timePro.mas_top).with.offset(-5);
        make.height.mas_equalTo(@(15));
    }];
    
    [_percentTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_timePro.mas_right).with.offset(-5);
        make.bottom.equalTo(_timePro.mas_top).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(150, 15));
    }];
    
    [_timePro mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(15);
        make.right.equalTo(_cancelBtn.mas_left).with.offset(-80);
        make.bottom.equalTo(_icon.mas_bottom).with.offset(-5);
        make.height.mas_equalTo(@(15));
    }];

    [_exchangeWireBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.top.equalTo(_icon.mas_top).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_pauseBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.centerY.equalTo(_icon.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_cancelBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.bottom.equalTo(_icon.mas_bottom).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
}

//换丝
- (void)changeFilament
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(printerSwitchWire)]) {
        [self.delegate printerSwitchWire];
    }
}

//暂停
- (void)pause
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(printerPause)]) {
        [self.delegate printerPause];
    }
}

//取消
- (void)printCenterCancel
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(printerCancel)]) {
        [self.delegate printerCancel];
    }
}
@end
