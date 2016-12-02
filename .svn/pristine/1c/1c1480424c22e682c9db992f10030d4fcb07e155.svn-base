//
//  TMXPrinterStatusWifiView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterStatusWifiView.h"

@interface TMXPrinterStatusWifiView ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *topImg;
@property (nonatomic, strong) UIView *middleView;
@property (nonatomic, strong) UIImageView *connectIcon;
@property (nonatomic, strong) UILabel *connnectLab;
@property (nonatomic, strong) UIImageView *bindIcon;
@property (nonatomic, strong) UILabel *bindLab;
@property (nonatomic, strong) UIImageView *completionIcon;
@property (nonatomic, strong) UILabel *completionLab;
@property (nonatomic, strong) UIImageView *bottomImg;

@property (nonatomic, strong) UIButton *startBtn;

@end

@implementation TMXPrinterStatusWifiView

-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = RGBColor(235, 235, 235);
    }
    return _backView;
}

-(UIImageView *)topImg{
    if (!_topImg) {
        _topImg=[UIImageView new];
        _topImg.image = [UIImage imageNamed:@"LinkStateBackView"];
    }
    return _topImg;
}

-(UIView *)middleView{
    if (!_middleView) {
        _middleView=[UIView new];
        _middleView.backgroundColor = RGBColor(235, 235, 235);
    }
    return _middleView;
}

-(UIImageView *)connectIcon{
    if (!_connectIcon) {
        _connectIcon=[UIImageView new];
        _connectIcon.image = [UIImage imageNamed:@"LinkWiFiSucIcon"];
    }
    return _connectIcon;
}
-(UILabel *)connnectLab{
    if (!_connnectLab) {
        _connnectLab=[UILabel new];
        _connnectLab.font = [UIFont systemFontOfSize:12];
        _connnectLab.text = @"连接网络";
    }
    return _connnectLab;
}

-(UIImageView *)bindIcon{
    if (!_bindIcon) {
        _bindIcon=[UIImageView new];
        _bindIcon.image = [UIImage imageNamed:@"LinkWiFiSucIcon"];
    }
    return _bindIcon;
}

-(UILabel *)bindLab{
    if (!_bindLab) {
        _bindLab=[UILabel new];
        _bindLab.font = [UIFont systemFontOfSize:12];
        _bindLab.text = @"绑定用户";
    }
    return _bindLab;
}

-(UIImageView *)completionIcon{
    if (!_completionIcon) {
        _completionIcon=[UIImageView new];
        _completionIcon.image = [UIImage imageNamed:@"LinkWiFiSucIcon"];
    }
    return _completionIcon;
}

-(UILabel *)completionLab{
    if (!_completionLab) {
        _completionLab=[UILabel new];
        _completionLab.font = [UIFont systemFontOfSize:12];
        _completionLab.text = @"完成";
    }
    return _completionLab;
}

-(UIImageView *)bottomImg{
    if (!_bottomImg) {
        _bottomImg=[UIImageView new];
        _bottomImg.image = [UIImage imageNamed:@"BottomIcon"];
        _bottomImg.backgroundColor = RGBColor(235, 235, 235);
    }
    return _bottomImg;
}

-(UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn=[UIButton buttonWithType:0];
        _startBtn.layer.cornerRadius = 5;
        _startBtn.layer.masksToBounds = YES;
        _startBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_startBtn setTitle:@"开始体验" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(startBtn:) forControlEvents:UIControlEventTouchUpInside];
        _startBtn.backgroundColor=systemColor;
    }
    return _startBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.topImg];
    [self.backView addSubview:self.middleView];
    [_middleView addSubview:self.connectIcon];
    [_middleView addSubview:self.connnectLab];
    [_middleView addSubview:self.bindIcon];
    [_middleView addSubview:self.bindLab];
    [_middleView addSubview:self.completionIcon];
    [_middleView addSubview:self.completionLab];
    [self.backView addSubview:self.bottomImg];
    [self addSubview:self.startBtn];
}


-(void)startBtn:(UIButton *)btn{
    if (self.startBlock) {
        self.startBlock();
    }
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);

    [_backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(_startBtn.mas_top).with.offset(-40);
    }];
    
    [_topImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).with.offset(64);
        make.centerX.equalTo(_backView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(280, 80));
    }];
    
    [_middleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topImg.mas_bottom);
        make.left.equalTo(_backView.mas_left);
        make.right.equalTo(_backView.mas_right);
        make.bottom.equalTo(_bottomImg.mas_top);
    }];
    
    [_connectIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_connnectLab.mas_left).with.offset(-10);
        make.bottom.equalTo(_bindIcon.mas_top).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_connnectLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bindLab.mas_top).with.offset(-10);
        make.left.equalTo(_bindLab.mas_left);
        make.right.equalTo(_bindLab.mas_right);
        make.height.mas_equalTo(@(20));
    }];
    
    
    [_bindIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bindLab.mas_left).with.offset(-10);
        make.centerY.equalTo(_middleView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_bindLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_middleView.mas_centerY);
        make.left.equalTo(_middleView.mas_centerX).with.offset(-5);
        make.right.equalTo(_middleView.mas_right);
        make.height.mas_equalTo(@(20));
    }];
    
    [_completionIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_completionLab.mas_left).with.offset(-10);
        make.top.equalTo(_bindIcon.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_completionLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bindLab.mas_bottom).with.offset(10);
        make.left.equalTo(_bindLab.mas_left);
        make.right.equalTo(_bindLab.mas_right);
        make.height.mas_equalTo(@(20));
    }];
    
    [_bottomImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_backView.mas_bottom);
        make.centerX.equalTo(_backView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(280, 120));
    }];
    
    [_startBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-40);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(280, 40));
    }];
    
}

@end
