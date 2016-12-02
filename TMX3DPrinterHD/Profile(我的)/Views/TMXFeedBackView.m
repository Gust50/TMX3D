//
//  TMXFeedBackView.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFeedBackView.h"

@interface TMXFeedBackView ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *titleNameLab;
@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *contactLab;
@property (nonatomic, strong) UITextField *contactTextField;

@property (nonatomic, strong) UIView *middleView;
@property (nonatomic, strong) UILabel *tipLab;
@property (nonatomic, strong) KBTextView *kbTextView;

@property (nonatomic, strong) UIButton *commitBtn;
@end

@implementation TMXFeedBackView

-(UIView *)topView{
    if (!_topView) {
        _topView=[UIView new];
    }
    return _topView;
}

-(UILabel *)titleNameLab{
    if (!_titleNameLab) {
        _titleNameLab=[UILabel new];
    }
    return _titleNameLab;
}

-(UITextField *)titleTextField{
    if (!_titleTextField) {
        _titleTextField=[UITextField new];
    }
    return _titleTextField;
}

-(UIView *)topLine{
    if (!_topLine) {
        _topLine=[UIView new];
    }
    return _topLine;
}

-(UILabel *)contactLab{
    if (!_contactLab) {
        _contactLab=[UILabel new];
    }
    return _contactLab;
}

-(UITextField *)contactTextField{
    if (!_contactTextField) {
        _contactTextField=[UITextField new];
    }
    return _contactTextField;
}

-(UIView *)middleView{
    if (!_middleView) {
        _middleView=[UIView new];
    }
    return _middleView;
}

-(UILabel *)tipLab{
    if (!_tipLab) {
        _tipLab=[UILabel new];
    }
    return _tipLab;
}

-(KBTextView *)kbTextView{
    if (!_kbTextView) {
        _kbTextView=[KBTextView new];
    }
    return _kbTextView;
}

-(UIButton *)commitBtn{
    if (!_commitBtn) {
        _commitBtn=[UIButton new];
    }
    return _commitBtn;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}


-(void)initUI{
    [self addSubview:self.topView];
    [_topView addSubview:self.titleNameLab];
    [_topView addSubview:self.titleTextField];
    [_topView addSubview:self.topLine];
    [_topView addSubview:self.contactLab];
    [_topView addSubview:self.contactTextField];
    [self addSubview:self.middleView];
    [_middleView addSubview:self.tipLab];
    [_middleView addSubview:self.kbTextView];
    [self addSubview:self.commitBtn];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    [_topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(-10);
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(@(80));
    }];
    
    [_titleNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(_titleTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_titleTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_top);
        make.bottom.equalTo(_topLine.mas_top);
        make.left.equalTo(_titleNameLab.mas_right).with.offset(10);
        make.right.equalTo(_topView.mas_right).with.offset(-10);
    }];
    
    [_topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_topView);
        make.centerY.equalTo(_topView.mas_centerY);
        make.height.mas_equalTo(@(1));
    }];
    
    [_contactLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topView.mas_left).with.offset(10);
        make.centerY.equalTo(_contactTextField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_contactTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contactLab.mas_right).with.offset(10);
        make.right.equalTo(_topView.mas_right).with.offset(-10);
        make.top.equalTo(_topLine.mas_bottom);
        make.bottom.equalTo(_topView.mas_bottom);
    }];
    
    [_middleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_bottom).with.offset(10);
        make.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(@(200));
    }];
    
    [_tipLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_middleView.mas_left).with.offset(10);
        make.top.equalTo(_middleView.mas_top);
        make.right.equalTo(_middleView.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(20));
    }];
    
    [_kbTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_middleView.mas_left).with.offset(10);
        make.right.equalTo(_middleView.mas_right).with.offset(-10);
        make.top.equalTo(_tipLab.mas_bottom);
        make.bottom.equalTo(_middleView.mas_bottom).with.offset(-10);
    }];
    
    [_commitBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-30);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(160, 40));
    }];
}



@end
