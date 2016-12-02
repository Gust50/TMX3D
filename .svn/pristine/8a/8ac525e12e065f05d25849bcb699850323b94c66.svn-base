//
//  TMXBgFixPrinterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBgFixPrinterVC.h"
#import "TMXFixPrinterVC.h"

@interface TMXBgFixPrinterVC ()
@property (nonatomic, strong) UIButton *backgroundBtn;
@property (nonatomic, strong) TMXFixPrinterVC *fixPrinterVC;
@property (nonatomic, strong) KBNavigationVC *nav;

@end

@implementation TMXBgFixPrinterVC
-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.alpha=.7;
        _backgroundBtn.backgroundColor=[UIColor blackColor];
        [_backgroundBtn addTarget:self action:@selector(removeBgBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)removeBgBtn:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(removeBackgroundBtn)]) {
        [self.delegate removeBackgroundBtn];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fixPrinterVC=[TMXFixPrinterVC new];
    _fixPrinterVC.isHide=YES;
    self.nav=[[KBNavigationVC alloc]initWithRootViewController:_fixPrinterVC];
    [self.view addSubview:self.backgroundBtn];
    [self.view addSubview:_nav.view];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    WS(weakSelf);
    [_backgroundBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
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

@end
