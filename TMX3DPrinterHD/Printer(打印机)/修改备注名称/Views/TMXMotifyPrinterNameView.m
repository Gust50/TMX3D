//
//  TMXMotifyPrinterNameView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXMotifyPrinterNameView.h"
#import "TMXMotifyPrinterNameContentView.h"

@implementation TMXMotifyPrinterNameView
#pragma mark <lazyLoad>
- (TMXMotifyPrinterNameContentView *)contentView{

    if (!_contentView) {
        _contentView = [[TMXMotifyPrinterNameContentView alloc] initWithFrame:CGRectZero];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 5;
    }
    return _contentView;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self updateConstraints];
}

#pragma mark <init UI>
- (void)initUI{
    
    [self addSubview:self.contentView];
//    [self adjustContentView];
    [self updateConstraints];
}

- (void)adjustContentView{

//    self.contentView.hidden = YES;
    if (Lanscape) {
        self.contentView.frame = CGRectMake(ScreenLW*APPScale/2-190, ScreenLH*APPScale, 380, ScreenLH*APPScale/2);
    }else{
    
        self.contentView.frame = CGRectMake(ScreenPW*APPScale/2-190, ScreenPH*APPScale, 380, ScreenPH*APPScale/2);
    }
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.contentView.hidden = NO;
        if (Lanscape) {
            self.contentView.frame = CGRectMake(ScreenLW*APPScale/2-190, ScreenLH*APPScale/4, 380, ScreenLH*APPScale/2);
        }else{
            
            self.contentView.frame = CGRectMake(ScreenPW*APPScale/2-190, ScreenPH*APPScale/4, 380, ScreenPH*APPScale/2);
        }
        [self addSubview:self.contentView];
        [self updateConstraints];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (Lanscape) {
            self.contentView.frame = CGRectMake(ScreenLW, ScreenLH, 320, ScreenLH/2);
        }else{
            
            self.contentView.frame = CGRectMake(ScreenPW, ScreenPH, 320, ScreenPH/2);
        }
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
        
    }];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationRemoveMotifyPrinterNameView" object:nil];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.equalTo(@380);
        make.height.equalTo(@450);
    }];
}

@end
