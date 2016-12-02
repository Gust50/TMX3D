//
//  TMXAboutVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXAboutVC.h"
#import "TMXAboutView.h"

@interface TMXAboutVC ()
@property (nonatomic, strong) TMXAboutView *aboutView;
@end

@implementation TMXAboutVC

-(TMXAboutView *)aboutView
{
    if (!_aboutView) {
        _aboutView = [TMXAboutView new];
    }
    return _aboutView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"关于yeehaw"];
    self.view.backgroundColor = backGroundColor;
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
    
    [self.view addSubview:self.aboutView];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    [_aboutView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end
