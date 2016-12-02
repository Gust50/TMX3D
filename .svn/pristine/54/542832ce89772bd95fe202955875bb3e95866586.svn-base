//
//  TMXTabBarVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/25.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXTabBarVC.h"
#import "TMXHomLeftTabBar.h"
#import "TMXHomeVC.h"
#import "TMXDesignVC.h"
#import "TMXProfileVC.h"
#import "TMXPrinterVC.h"

@interface TMXTabBarVC ()<TMXHomLeftTabBarDelegate>
@property (nonatomic, strong) TMXHomLeftTabBar *leftTabBar;
@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation TMXTabBarVC

#pragma mark <lazyLoad>
-(TMXHomLeftTabBar *)leftTabBar{
    if (!_leftTabBar) {
        _leftTabBar=[TMXHomLeftTabBar new];
        _leftTabBar.delegate=self;
    }
    return _leftTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex=0;
    self.view.backgroundColor=backGroundColor;
    [self.view addSubview:self.leftTabBar];
    
    [self addChildViewVC];
    
    [self viewWillTransitionToSize:self.view.size withTransitionCoordinator:self.transitionCoordinator];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dealPush:) name:@"PushChangeFrame" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dealPop:) name:@"PopChangeFrame" object:nil];
}



-(void)addChildViewVC{
    
    TMXHomeVC *_homeVC=[TMXHomeVC new];
    KBNavigationVC *nav=[[KBNavigationVC alloc]initWithRootViewController:_homeVC];
    
    [self addChildViewController:nav];
    
    TMXPrinterVC *_printerVC=[TMXPrinterVC new];
    nav=[[KBNavigationVC alloc]initWithRootViewController:_printerVC];
    [self addChildViewController:nav];
    
    TMXDesignVC *_designVC=[TMXDesignVC new];
    nav=[[KBNavigationVC alloc]initWithRootViewController:_designVC];
    [self addChildViewController:nav];
    
    TMXProfileVC *_profileVC=[TMXProfileVC new];
    nav=[[KBNavigationVC alloc]initWithRootViewController:_profileVC];
    [self addChildViewController:nav];
    
     [self switchTabBarFromIndex:0 toIndex:0];
}

-(void)switchTabBarFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    
    UIViewController *oldVC=self.childViewControllers[fromIndex];
    [oldVC.view removeFromSuperview];
    
    UIViewController *newVC=self.childViewControllers[toIndex];
    self.currentVC=newVC;
    [self.view addSubview:newVC.view];
    
    WS(weakSelf);
    [newVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(weakSelf.view.mas_right).with.offset(0);
       make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
       make.left.equalTo(weakSelf.leftTabBar.mas_right).with.offset(10);
       make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];    
}


-(void)dealPush:(NSNotification *)notification{
    WS(weakSelf);
    [_currentVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).with.offset(0);
        make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
}

-(void)dealPop:(NSNotification *)notification{
    WS(weakSelf);
    [_currentVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).with.offset(0);
        make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
        make.left.equalTo(weakSelf.leftTabBar.mas_right).with.offset(10);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
}


-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_leftTabBar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.top.equalTo(weakSelf.view.mas_top);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.width.mas_equalTo(@(kLeftTabBarLW));
    }];
}


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
//    if (Lanscape) {
//        _leftTabBar.width=kLeftTabBarLW;
//        _leftTabBar.height=size.height;
//    }else{
//        _leftTabBar.width=kLeftTabBarPW;
//        _leftTabBar.height=size.height;
//    }
    NSLog(@"此方法的轨迹");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ScreenRotate" object:nil userInfo:@{@"isRotate":@(YES)}];
}


#pragma mark <TMXHomLeftTabBarDelegate>
-(void)clickTabBarBtn:(NSString *)name{
    if ([name isEqualToString:@"首页"]) {
        [self switchTabBarFromIndex:_currentIndex toIndex:0];
        _currentIndex=0;
    }else if ([name isEqualToString:@"打印机"]){
        [self switchTabBarFromIndex:_currentIndex toIndex:1];
        _currentIndex=1;
    }else if ([name isEqualToString:@"创作"]){
        [self switchTabBarFromIndex:_currentIndex toIndex:2];
        _currentIndex=2;
    }else{
        [self switchTabBarFromIndex:_currentIndex toIndex:3];
        _currentIndex=3;
    }
}
@end
