//
//  KBtopImgBottomTextBtn.m
//  ClshMerchant
//
//  Created by kobe on 16/8/1.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "KBtopImgBottomTextBtn.h"

@interface KBtopImgBottomTextBtn ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *name;
@end

@implementation KBtopImgBottomTextBtn

#pragma mark <lazyLoad>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
    }
    return _icon;
}

-(UILabel *)name{
    if (!_name) {
        _name=[UILabel new];
        _name.textAlignment=NSTextAlignmentCenter;
    }
    return _name;
}

#pragma mark <initWithFrame>
-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
        [self addGestureRecognizer:tap];
        
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(5);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.bottom.equalTo(_name.mas_top).with.offset(-5);
        make.width.equalTo(_icon.mas_height);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(@(15));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
}


#pragma mark <otherResponse>
-(void)clickView:(UITapGestureRecognizer *)gesture{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickKBtopImgBottomTextBtn:)]) {
        [self.delegate clickKBtopImgBottomTextBtn:_classifyID];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBtnName:printerTaskID:)]) {
        [self.delegate clickBtnName:_name.text printerTaskID:_printerTaskID];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBtnName:)]) {
        [self.delegate clickBtnName:_name.text];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBtnTag:)]) {
        [self.delegate clickBtnTag:_btnTag];
    }
    
}

#pragma mark <getter setter>
-(void)setIconUrl:(NSString *)iconUrl{
    _iconUrl=iconUrl;
    if (_isHomeIcon) {
        [_icon sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:nil];
    }else
    {
         _icon.image=[UIImage imageNamed:iconUrl];
    }
}

-(void)setNameContent:(NSString *)nameContent{
    _nameContent=nameContent;
    _name.text=nameContent;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor=textColor;
    _name.textColor=textColor;
}

-(void)setTextFont:(UIFont *)textFont{
    _textFont=textFont;
    _name.font=textFont;
}

-(void)setIsHomeIcon:(BOOL)isHomeIcon
{
    _isHomeIcon = isHomeIcon;
}

-(void)setClassifyID:(NSInteger)classifyID
{
    _classifyID = classifyID;
}

-(void)setPrinterTaskID:(NSInteger)printerTaskID
{
    _printerTaskID = printerTaskID;
}

-(void)setBtnTag:(NSInteger)btnTag
{
    _btnTag = btnTag;
}
@end
