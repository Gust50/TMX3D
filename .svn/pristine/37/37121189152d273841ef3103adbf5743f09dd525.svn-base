//
//  TMXAddPrinterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAddPrinterVC.h"
#import "KBtopImgBottomTextBtn.h"
#import "TMXAddPrinterWifiView.h"
#import "TMXAddPrinterWifiVC.h"


@interface TMXAddPrinterVC ()<KBtopImgBottomTextBtnDelegate>
@property (nonatomic, strong) UIButton *backgroundBtn;
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) KBtopImgBottomTextBtn *wifiBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *qrCodeBtn;
@property (nonatomic, strong) UIView *middleLine;
@property (nonatomic, strong) TMXAddPrinterWifiView *addWifiView;
@property (nonatomic, strong) TMXAddPrinterWifiVC *addWifiVC;
@property (nonatomic, strong) KBNavigationVC *nav;
@end

@implementation TMXAddPrinterVC

-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.backgroundColor=[UIColor blackColor];
        _backgroundBtn.alpha=.7;
        [_backgroundBtn addTarget:self action:@selector(removeBackgrounBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

-(UIView *)popView{
    if (!_popView) {
        _popView=[UIView new];
        _popView.backgroundColor=[UIColor whiteColor];
        _popView.userInteractionEnabled=YES;
    }
    return _popView;
}

-(KBtopImgBottomTextBtn *)wifiBtn{
    if (!_wifiBtn) {
        _wifiBtn=[KBtopImgBottomTextBtn new];
        _wifiBtn.btnTag=100;
        _wifiBtn.nameContent=@"wifi添加";
        _wifiBtn.iconUrl = @"LocalPhoto";
        _wifiBtn.delegate=self;
    }
    return _wifiBtn;
}

-(KBtopImgBottomTextBtn *)qrCodeBtn{
    if (!_qrCodeBtn) {
        _qrCodeBtn=[KBtopImgBottomTextBtn new];
        _qrCodeBtn.delegate=self;
        _qrCodeBtn.nameContent=@"二维码添加";
        _qrCodeBtn.iconUrl = @"LocalPhoto";
        _qrCodeBtn.btnTag=101;
    }
    return _qrCodeBtn;
}


-(UIView *)middleLine{
    if (!_middleLine) {
        _middleLine=[UIView new];
        _middleLine.backgroundColor = RGBColor(237, 237, 237);
    }
    return _middleLine;
}


-(TMXAddPrinterWifiView *)addWifiView{
    if (!_addWifiView) {
        _addWifiView=[TMXAddPrinterWifiView new];
        
    }
    return _addWifiView;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    WS(weakSelf);
    if (Lanscape) {
        [_nav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.view.mas_centerX);
            make.centerY.equalTo(weakSelf.view.mas_centerY);
            make.width.mas_equalTo(@(ScreenW/2));
            make.height.mas_equalTo(@(ScreenH/1.5));
        }];
    }else{
        [_nav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.view.mas_centerX);
            make.centerY.equalTo(weakSelf.view.mas_centerY);
            make.width.mas_equalTo(@(ScreenW/1.5));
            make.height.mas_equalTo(@(ScreenH/2));
        }];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.backgroundBtn];
    [_backgroundBtn addSubview:self.popView];
    [_popView addSubview:self.wifiBtn];
    [_popView addSubview:self.middleLine];
    [_popView addSubview:self.qrCodeBtn];
    
}

-(void)removeBackgrounBtn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(removeBackground)]) {
        [self.delegate removeBackground];
    }
}




-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_backgroundBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_popView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backgroundBtn.mas_top).with.offset(64);
        make.right.equalTo(_backgroundBtn.mas_right).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(120, 240));
    }];
    
    
    [_wifiBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_popView.mas_left).with.offset(10);
        make.top.equalTo(_popView.mas_top).with.offset(10);
        make.right.equalTo(_popView.mas_right).with.offset(-10);
        make.bottom.equalTo(_middleLine.mas_top).with.offset(-10);
    }];
    
    [_middleLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_popView.mas_centerX);
        make.centerY.equalTo(_popView.mas_centerY);
        make.left.equalTo(_popView.mas_left);
        make.right.equalTo(_popView.mas_right);
        make.height.mas_equalTo(@(1));
    }];
    
    [_qrCodeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_middleLine.mas_bottom).with.offset(10);
        make.left.equalTo(_popView.mas_left).with.offset(10);
        make.right.equalTo(_popView.mas_right).with.offset(-10);
        make.bottom.equalTo(_popView.mas_bottom).with.offset(-10);
    }];
}

-(void)clickBtnTag:(NSInteger)btnTag{
     [_popView removeFromSuperview];
    if (btnTag==100) {
        
        self.addWifiVC=[TMXAddPrinterWifiVC new];
        self.nav=[[KBNavigationVC alloc]initWithRootViewController:_addWifiVC];
        [self.view addSubview:_nav.view];
        
        WS(weakSelf);
        
        if (Lanscape) {
            [_nav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf.view.mas_centerX);
                make.centerY.equalTo(weakSelf.view.mas_centerY);
                make.width.mas_equalTo(@(ScreenW/2));
                make.height.mas_equalTo(@(ScreenH/1.5));
            }];
        }else{
            [_nav.view mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf.view.mas_centerX);
                make.centerY.equalTo(weakSelf.view.mas_centerY);
                make.width.mas_equalTo(@(ScreenW/1.5));
                make.height.mas_equalTo(@(ScreenH/2));
            }];
        }
        
    }else{

    }
}

@end
