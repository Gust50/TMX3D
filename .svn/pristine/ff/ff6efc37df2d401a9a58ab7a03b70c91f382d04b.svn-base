//
//  TMXShareUserLisetHeadView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXShareUserLisetHeadView.h"

@implementation TMXShareUserLisetHeadView

#pragma mark <lazy Load>
- (UILabel *)describeLabel{

    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = RGBColor(53, 53, 53);
        _describeLabel.font = [UIFont systemFontOfSize:15];
        _describeLabel.text = @"红红火火恍恍惚惚哈哈哈哈";
    }
    return _describeLabel;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.describeLabel];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}

@end
