//
//  TMXcenterSetupView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXcenterSetupView.h"
#define LeftTitleColor     [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define RightTitleColor    [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]

@interface TMXcenterSetupView()
@property(nonatomic,strong)UILabel *showLabel;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIButton *backBtn;


@property(nonatomic,strong)UIView *cacheView;
@property(nonatomic,strong)UILabel *cacheLabel;
@property(nonatomic,strong)UILabel *cacheDataLabel;
@property(nonatomic,strong)UIButton *clearCacheBtn;


@property(nonatomic,strong)UIView *ideaView;
@property(nonatomic,strong)UILabel *ideaLabel;
@property(nonatomic,strong)UIButton *ideaBtn;

@property(nonatomic,strong)UIView *yeeView;
@property(nonatomic,strong)UILabel *yeeLabel;
@property(nonatomic,strong)UIButton *yeeBtn;


@property(nonatomic,strong)UIView *phoneView;
@property(nonatomic,strong)UILabel *phoneLabel;
@property(nonatomic,strong)UILabel *showPhoneLabel;


@property(nonatomic,strong)UIView *scoreView;
@property(nonatomic,strong)UILabel *scoreLabel;
@property(nonatomic,strong)UILabel *showScoreLabel;
@property(nonatomic,strong)UIButton *scoreBtn;


@property(nonatomic,strong)UIView *resetPassWordView;
@property(nonatomic,strong)UILabel *resetPassWordLabel;
@property(nonatomic,strong)UIButton *ResetPassWordBtn;


@property(nonatomic,strong)UIButton *loginOutBtn;

@property (nonatomic, strong) UIView *loginView;
@property (nonatomic, strong) UIButton *backgroundBtn;
@end

@implementation TMXcenterSetupView
-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.alpha=.6;
        _backgroundBtn.backgroundColor=[UIColor blackColor];
        [_backgroundBtn addTarget:self action:@selector(removeBgBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

-(UIView *)loginView{
    if (!_loginView) {
        _loginView=[UIView new];

        _loginView.backgroundColor= [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    }
    return _loginView;
}


- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}
- (UILabel *)showLabel{
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
        _showLabel.text = @"设置中心";
        _showLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _showLabel;
}
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"CancelIcon"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)backAC{
    if (self.backblock) {
        self.backblock();
    }
}
- (UIView *)cacheView{
    if (!_cacheView) {
        _cacheView = [UIView new];
        _cacheView.backgroundColor = [UIColor whiteColor];
    }
    return _cacheView;
}

- (UILabel *)cacheLabel{
    if (!_cacheLabel) {
        _cacheLabel = [UILabel new];
        _cacheLabel.text = @"清除缓存";
        _cacheLabel.textColor = LeftTitleColor;
    }
    return _cacheLabel;
}
- (UILabel *)cacheDataLabel{
    if (!_cacheDataLabel) {
        _cacheDataLabel = [UILabel new];
        _cacheDataLabel.text = @"2.55M";
        _cacheDataLabel.textAlignment = NSTextAlignmentRight;
        _cacheDataLabel.textColor = RightTitleColor;
        
    }
    return _cacheDataLabel;
}
- (UIButton *)clearCacheBtn{
    if (!_clearCacheBtn) {
        _clearCacheBtn = [UIButton new];
        [_clearCacheBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_clearCacheBtn addTarget:self action:@selector(clearCacheBtnBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearCacheBtn;
}
- (void)clearCacheBtnBtnAC{
    if (self.cacheblock) {
        self.cacheblock();
    }
}

- (UIView *)ideaView{
    if (!_ideaView) {
        _ideaView = [UIView new];
        _ideaView.backgroundColor = [UIColor whiteColor];
    }
    return _ideaView;
}
- (UILabel *)ideaLabel{
    if (!_ideaLabel) {
        _ideaLabel = [UILabel new];
        _ideaLabel.text = @"意见反馈";
        _ideaLabel.textColor = LeftTitleColor;
        
    }
    return _ideaLabel;
}

- (UIButton *)ideaBtn{
    if (!_ideaBtn) {
        _ideaBtn = [UIButton new];
        [_ideaBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_ideaBtn addTarget:self action:@selector(ideaBtnBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ideaBtn;
}
- (void)ideaBtnBtnAC{
    if (self.ideablock) {
        self.ideablock();
    }
}
- (UIView *)yeeView{
    if (!_yeeView) {
        _yeeView = [UIView new];
        _yeeView.backgroundColor = [UIColor whiteColor];
    }
    return _yeeView;
}
- (UILabel *)yeeLabel{
    if (!_yeeLabel) {
        _yeeLabel = [UILabel new];
        _yeeLabel.text = @"关于yeehaw";
        _yeeLabel.textColor = LeftTitleColor;
    }
    return _yeeLabel;
}

- (UIButton *)yeeBtn{
    if (!_yeeBtn) {
        _yeeBtn = [UIButton new];
        [_yeeBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_yeeBtn addTarget:self action:@selector(yeeBtnBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yeeBtn;
}
- (void)yeeBtnBtnAC{
    if (self.yeeblock) {
        self.yeeblock();
    }
}


- (UIView *)phoneView{
    if (!_phoneView) {
        _phoneView = [UIView new];
        _phoneView.backgroundColor = [UIColor whiteColor];
    }
    return _phoneView;
}
- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [UILabel new];
        _phoneLabel.text = @"客服电话";
        _phoneLabel.textColor = LeftTitleColor;
    }
    return _phoneLabel;
}
- (UILabel *)showPhoneLabel{
    if (!_showPhoneLabel) {
        _showPhoneLabel = [UILabel new];
        _showPhoneLabel.text = @"400-255-2585";
        _showPhoneLabel.textAlignment = NSTextAlignmentRight;
        _showPhoneLabel.textColor = RightTitleColor;
    }
    return _showPhoneLabel;
}

- (UIView *)scoreView{
    if (!_scoreView) {
        _scoreView = [UIView new];
        _scoreView.backgroundColor = [UIColor whiteColor];
    }
    return _scoreView;
}
- (UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [UILabel new];
        _scoreLabel.text = @"打分鼓励一下";
        _scoreLabel.textColor = LeftTitleColor;
    }
    return _scoreLabel;
}
- (UILabel *)showScoreLabel{
    if (!_showScoreLabel) {
        _showScoreLabel = [UILabel new];
        _showScoreLabel.text = @"去AppStore打分";
        _showScoreLabel.textAlignment = NSTextAlignmentRight;
        _showScoreLabel.textColor = RightTitleColor;
    }
    return _showScoreLabel;
}
- (UIButton *)scoreBtn{
    if (!_scoreBtn) {
        _scoreBtn = [UIButton new];
        [_scoreBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_scoreBtn addTarget:self action:@selector(scoreBtnBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scoreBtn;
}
- (void)scoreBtnBtnAC{
    if (self.scoreblock) {
        self.scoreblock();
    }
}



- (UIView *)resetPassWordView{
    if (!_resetPassWordView) {
        _resetPassWordView  = [UIView new];
        _resetPassWordView.backgroundColor = [UIColor whiteColor];
    }
    return _resetPassWordView;
}
- (UILabel *)resetPassWordLabel{
    if (!_resetPassWordLabel) {
        _resetPassWordLabel = [UILabel new];
        _resetPassWordLabel.text = @"重置密码";
        _resetPassWordLabel.textColor = LeftTitleColor;
    }
    return _resetPassWordLabel;
}
- (UIButton *)ResetPassWordBtn{
    if (!_ResetPassWordBtn) {
        _ResetPassWordBtn = [UIButton new];
        [_ResetPassWordBtn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
        [_ResetPassWordBtn addTarget:self action:@selector(ResetPassWordBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ResetPassWordBtn;
}
- (void)ResetPassWordBtnAC{
    if (self.resetPassWordblock) {
        self.resetPassWordblock();
    }
}

- (UIButton *)loginOutBtn{
    if (!_loginOutBtn) {
        _loginOutBtn = [UIButton new];
        [_loginOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_loginOutBtn setBackgroundColor:[UIColor orangeColor]];
        _loginOutBtn.layer.cornerRadius = 10;
        [_loginOutBtn addTarget:self action:@selector(loginOutAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginOutBtn;
}
- (void)loginOutAC{
    if (self.loginOutblock) {
        self.loginOutblock();
    }
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.backgroundBtn];
    [self addSubview:self.loginView];
  
    [_loginView addSubview:self.topView];
    [_topView addSubview:self.showLabel];
    [_topView addSubview:self.backBtn];
    
    [_loginView addSubview:self.cacheView];
    [_cacheView addSubview:self.cacheLabel];
    [_cacheView addSubview:self.clearCacheBtn];
    [_cacheView addSubview:self.cacheDataLabel];

    [_loginView addSubview:self.ideaView];
    [_ideaView addSubview:self.ideaLabel];
    [_ideaView addSubview:self.ideaBtn];
   
    [_loginView addSubview:self.yeeView];
    [_yeeView addSubview:self.yeeLabel];
    [_yeeView addSubview:self.yeeBtn];

    [_loginView addSubview:self.phoneView];
    [_phoneView addSubview:self.phoneLabel];
    [_phoneView addSubview:self.showPhoneLabel];

    [_loginView addSubview:self.scoreView];
    [_scoreView addSubview:self.scoreLabel];
    [_scoreView addSubview:self.scoreBtn];
    [_scoreView addSubview:self.showScoreLabel];

    [_loginView addSubview:self.resetPassWordView];
    [_resetPassWordView addSubview:self.resetPassWordLabel];
    [_resetPassWordView addSubview:self.ResetPassWordBtn];

    
    [_loginView addSubview:self.loginOutBtn];
    [self updateConstraints];
}
-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}



-(void)removeBgBtn:(UIButton *)btn{
    if (self.backblock) {
        self.backblock();
    }
}

- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    CGFloat BagHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat BagWidth = [UIScreen mainScreen].bounds.size.width;
    
    [_backgroundBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(weakSelf);
    }];
    
    if (Lanscape) {
      NSLog(@"横屏");
        [_loginView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(BagWidth/2, BagHeight/1.5));
        }];
        
        [_loginOutBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginView.mas_centerX);
            make.width.mas_equalTo(@(BagWidth/3));
            make.bottom.equalTo(_loginView.mas_bottom).offset(-20);
            make.height.equalTo(@40);
        }];

    }else{
        NSLog(@"竖屏");
        [_loginView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(BagWidth/1.5, BagHeight/2));
        }];

        [_loginOutBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_loginView.mas_centerX);
            make.width.mas_equalTo(@(BagWidth/2.25));
            make.bottom.equalTo(_loginView.mas_bottom).offset(-20);
            make.height.equalTo(@40);
        }];
    }
    [_topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginView.mas_left);
        make.top.equalTo(_loginView.mas_top);
        make.width.equalTo(_loginView.mas_width);
        make.height.mas_equalTo(@80);
        
    }];
    [_showLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_topView.mas_centerX);
        make.width.equalTo(@(80));
        make.centerY.equalTo(_topView.mas_centerY);
        make.height.equalTo(@(40));
        
    }];
    [_backBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_topView.mas_right).offset(-10);
        make.width.mas_equalTo(@30);
        make.centerY.equalTo(_showLabel.mas_centerY);
        make.height.mas_equalTo(@30);
    }];
    
    
    [_cacheView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_cacheLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_cacheView.mas_left).offset(20);
        make.centerY.equalTo(_cacheView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [_clearCacheBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_cacheView.mas_centerY);
    }];
    [_cacheDataLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_cacheLabel.mas_right);
        make.right.equalTo(_clearCacheBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_cacheView.mas_centerY);
    }];
    
    
    [_ideaView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cacheView.mas_bottom).offset(3);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_ideaLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_ideaView.mas_left).offset(20);
        make.centerY.equalTo(_ideaView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [_ideaBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_ideaView.mas_centerY);
    }];
    
    [_yeeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ideaView.mas_bottom).offset(10);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_yeeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_yeeView.mas_left).offset(20);
        make.centerY.equalTo(_yeeView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(140, 40));
    }];
    [_yeeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_yeeView.mas_centerY);
    }];
    
    [_phoneView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_yeeView.mas_bottom).offset(3);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_phoneLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneView.mas_left).offset(20);
        make.centerY.equalTo(_phoneView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    [_showPhoneLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLabel.mas_right);
        make.right.equalTo(_cacheDataLabel.mas_right);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_phoneView.mas_centerY);
    }];
    
    
    [_scoreView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneView.mas_bottom).offset(3);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_scoreLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scoreView.mas_left).offset(20);
        make.centerY.equalTo(_scoreView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(140, 40));
    }];
    [_scoreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_scoreView.mas_centerY);
    }];
    [_showScoreLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scoreLabel.mas_left);
        make.right.equalTo(_scoreBtn.mas_left).offset(-15);
        make.height.equalTo(@(40));
        make.centerY.equalTo(_scoreView.mas_centerY);
    }];
    
    
    
    [_resetPassWordView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scoreView.mas_bottom).offset(10);
        make.width.equalTo(_loginView.mas_width);
        make.left.equalTo(_loginView.mas_left);
        make.height.equalTo(@(80));
    }];
    [_resetPassWordLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_resetPassWordView.mas_left).offset(20);
        make.centerY.equalTo(_resetPassWordView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [_ResetPassWordBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginView.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(10, 40));
        make.centerY.equalTo(_resetPassWordView.mas_centerY);
    }];
    
    
}
@end
