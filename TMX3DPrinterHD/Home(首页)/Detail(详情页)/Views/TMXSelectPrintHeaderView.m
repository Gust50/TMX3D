//
//  TMXSelectPrintHeaderView.m
//  TMX3DPrinterHD
//
//  Created by 吴桃波 on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectPrintHeaderView.h"

@interface TMXSelectPrintHeaderView ()
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UIButton *cancel;
@end
@implementation TMXSelectPrintHeaderView

-(UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:14];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.text = @"选择打印机";
    }
    return _title;
}

-(UIButton *)cancel
{
    if (!_cancel) {
        _cancel = [[UIButton alloc] init];
        [_cancel setImage:[UIImage imageNamed:@"CancelIcon"] forState:UIControlStateNormal];
        [_cancel addTarget:self action:@selector(cancelSelect) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancel;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = RGBColor(228, 228, 228);
        [self addSubview:self.title];
        [self addSubview:self.cancel];
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(150, 20));
    }];
    [_cancel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}

//取消选择打印机
- (void)cancelSelect
{
    if (self.removeHeaderBlock) {
        self.removeHeaderBlock();
    }
}

@end
