//
//  TMXHomLeftTabBar.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/20.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomLeftTabBar.h"
#import "KBtopImgBottomTextBtn.h"

@interface TMXHomLeftTabBar ()<KBtopImgBottomTextBtnDelegate>
@property (nonatomic, strong) KBtopImgBottomTextBtn *homeBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *printerBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *drawBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *profileBtn;
@end

@implementation TMXHomLeftTabBar


#pragma mark <lazyLoad>
-(KBtopImgBottomTextBtn *)homeBtn{
    if (!_homeBtn) {
        _homeBtn=[KBtopImgBottomTextBtn new];
        _homeBtn.textFont=[UIFont systemFontOfSize:14];
        _homeBtn.iconUrl=@"Home_select";
        _homeBtn.textColor=systemColor;
        _homeBtn.nameContent=@"首页";
        _homeBtn.delegate=self;
    }
    return _homeBtn;
}

-(KBtopImgBottomTextBtn *)printerBtn{
    if (!_printerBtn) {
        _printerBtn=[KBtopImgBottomTextBtn new];
        _printerBtn.textFont=[UIFont systemFontOfSize:14];
        _printerBtn.iconUrl=@"Printer_normal";
        _printerBtn.nameContent=@"打印机";
        _printerBtn.delegate=self;
    }
    return _printerBtn;
}

-(KBtopImgBottomTextBtn *)drawBtn{
    if (!_drawBtn) {
        _drawBtn=[KBtopImgBottomTextBtn new];
        _drawBtn.textFont=[UIFont systemFontOfSize:14];
        _drawBtn.iconUrl=@"Design_normal";
        _drawBtn.nameContent=@"创作";
        _drawBtn.delegate=self;
    }
    return _drawBtn;
}

-(KBtopImgBottomTextBtn *)profileBtn{
    if (!_profileBtn) {
        _profileBtn=[KBtopImgBottomTextBtn new];
        _profileBtn.textFont=[UIFont systemFontOfSize:14];
        _profileBtn.iconUrl=@"Profile_normal";
        _profileBtn.nameContent=@"我的";
        _profileBtn.delegate=self;
    }
    return _profileBtn;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.homeBtn];
    [self addSubview:self.printerBtn];
    [self addSubview:self.drawBtn];
    [self addSubview:self.profileBtn];
}


-(void)clickBtnName:(NSString *)name{
    [self resetAllBtn];
    if ([name isEqualToString:@"首页"]) {
        _homeBtn.iconUrl=@"Home_select";
        _homeBtn.textColor=systemColor;
    }else if ([name isEqualToString:@"打印机"]){
        _printerBtn.iconUrl=@"Printer_select";
        _printerBtn.textColor=systemColor;
    }else if ([name isEqualToString:@"创作"]){
        _drawBtn.iconUrl=@"Design_select";
        _drawBtn.textColor=systemColor;
    }else{
        _profileBtn.iconUrl=@"Profile_select";
        _profileBtn.textColor=systemColor;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickTabBarBtn:)]) {
        [self.delegate clickTabBarBtn:name];
    }
}

-(void)resetAllBtn{
    _homeBtn.iconUrl=@"Home_normal";
    _printerBtn.iconUrl=@"Printer_normal";
    _drawBtn.iconUrl=@"Design_normal";
    _profileBtn.iconUrl=@"Profile_normal";
    
    _homeBtn.textColor=[UIColor blackColor];
    _printerBtn.textColor=[UIColor blackColor];
    _drawBtn.textColor=[UIColor blackColor];
    _profileBtn.textColor=[UIColor blackColor];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    LRLog(@"-------------屏幕旋转---------------");
    [_homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_printerBtn.mas_top).with.offset(-40);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_printerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.bottom.equalTo(weakSelf.mas_centerY).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_drawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_centerY).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_profileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_drawBtn.mas_bottom).with.offset(40);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

@end
