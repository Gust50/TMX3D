//
//  TMXSearchHistoryHeader.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSearchHistoryHeader.h"

@interface TMXSearchHistoryHeader ()

@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UIButton *clearBtn;

@end
@implementation TMXSearchHistoryHeader

-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:14];
        _title.text = @"热门搜索";
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

-(UIButton *)clearBtn
{
    if (!_clearBtn) {
        _clearBtn = [UIButton new];
        [_clearBtn setTitle:@"清空" forState:UIControlStateNormal];
        _clearBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_clearBtn setTitleColor:RGBColor(171, 171, 171) forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearHistory) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.title];
    [self addSubview:self.clearBtn];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY).with.offset(20);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    [_clearBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY).with.offset(20);
        make.right.equalTo(weakSelf.mas_right);
        make.size.mas_equalTo(CGSizeMake(150, 20));
    }];
}

#pragma mark - setter getter
-(void)setIsHideClearBtn:(BOOL)isHideClearBtn
{
    _clearBtn.hidden = isHideClearBtn;
}

-(void)setContent:(NSString *)content
{
    _title.text = content;
}

- (void)clearHistory
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickClearAllHistory)]) {
        [self.delegate clickClearAllHistory];
    }
}

@end
