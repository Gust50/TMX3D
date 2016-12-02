//
//  TMXBgSetupVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBgSetupVC.h"
#import "TMXSetupVC.h"

@interface TMXBgSetupVC ()
@property (nonatomic, strong) UIButton *backgroundBtn;
@property (nonatomic, strong) KBNavigationVC *nav;
@end

@implementation TMXBgSetupVC


#pragma mark <lazyLoad>
-(UIButton *)backgroundBtn{
    if (!_backgroundBtn) {
        _backgroundBtn=[UIButton buttonWithType:0];
        _backgroundBtn.alpha=.7;
        _backgroundBtn.backgroundColor=[UIColor blackColor];
        [_backgroundBtn addTarget:self action:@selector(removeBackgroundBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundBtn];
    _nav=[[KBNavigationVC alloc]initWithRootViewController:[TMXSetupVC new]];
    [self.view addSubview:_nav.view];
}

-(void)removeBackgroundBtn:(UIButton *)btn{
    if (self.removeBgSetupBlock) {
        self.removeBgSetupBlock();
    }
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
