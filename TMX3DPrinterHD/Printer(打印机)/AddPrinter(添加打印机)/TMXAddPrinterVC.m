//
//  TMXAddPrinterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAddPrinterVC.h"
#import "KBtopImgBottomTextBtn.h"


@interface TMXAddPrinterVC ()
@property (nonatomic, strong) UIButton *backgroundBtn;
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) KBtopImgBottomTextBtn *wifiBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *qrCodeBtn;

@end

@implementation TMXAddPrinterVC

-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.backgroundColor=backGroundColor;
        _backgroundBtn.alpha=.7;
    }
    return _backgroundBtn;
}

-(UIView *)popView{
    if (!_popView) {
        _popView=[UIView new];
        _popView.backgroundColor=[UIColor blueColor];
    }
    return _popView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.backgroundBtn];
    [_backgroundBtn addSubview:self.popView];
    
    
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    
    [_backgroundBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_popView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backgroundBtn.mas_top).with.offset(64);
        make.right.equalTo(_backgroundBtn.mas_right).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(120, 240));
    }];
}


@end
