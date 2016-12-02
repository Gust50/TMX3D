//
//  TMXCreateQRcodeView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXCreateQRcodeView.h"
#import "TMXQRContentView.h"

@interface TMXCreateQRcodeView ()

@property (nonatomic, strong)TMXQRContentView *contentView;

@end
@implementation TMXCreateQRcodeView
#pragma mark <lazyLoad>
- (TMXQRContentView *)contentView{

    if (!_contentView) {
        _contentView = [[TMXQRContentView alloc] initWithFrame:CGRectZero];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 35;
    }
    return _contentView;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)layoutSubviews{

    [super layoutSubviews];
    [self constrainView];
}

- (void)initUI{

    [self adjustContentView];
}

- (void)constrainView{

     self.contentView.frame = CGRectMake(self.center.x-190, self.center.y-225, 380, 450);
}

- (void)adjustContentView{

     self.contentView.frame = CGRectMake(self.center.x+190, self.center.y-225, 0, 450);
//    self.contentView.alpha = 0;
    [self addSubview:self.contentView];
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
         self.contentView.frame = CGRectMake(self.center.x-190, self.center.y-225, 380, 450);
//        _contentView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (self.removeQRcodeViewblock) {
        self.removeQRcodeViewblock();
    }
}

- (void)useAnimation{

    [self adjustContentView];
}

@end
