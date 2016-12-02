//
//  TMXRemarkHeaderView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXRemarkHeaderView.h"

@interface TMXRemarkHeaderView ()
@property (nonatomic, strong)UILabel *leftLab;
@property (nonatomic, strong)UILabel *rightLab;
@end
@implementation TMXRemarkHeaderView

-(UILabel *)leftLab
{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.font = [UIFont systemFontOfSize:13];
        _leftLab.textColor = RGBColor(103, 103, 103);
        _leftLab.text = @"共有189位用户参与了评论";
    }
    return _leftLab;
}

-(UILabel *)rightLab
{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.font = [UIFont systemFontOfSize:11];
        _rightLab.textColor = RGBColor(168, 168, 168);
        _rightLab.text = @"查看更多评论>>";
        _rightLab.textAlignment = NSTextAlignmentRight;
    }
    return _rightLab;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = backGroundColor;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.leftLab];
    [self addSubview:self.rightLab];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 15));
    }];
    
    [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_rightLab.mas_left).with.offset(-10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.height.mas_equalTo(@(15));
    }];
}

#pragma mark - setter getter
-(void)setUserCount:(NSInteger)userCount
{
    _userCount = userCount;
    _leftLab.text = [NSString stringWithFormat:@"共有%ld位用户参与了评论", userCount];
    NSScanner *scanner = [NSScanner scannerWithString:_leftLab.text];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    
    int number;
    [scanner scanInt:&number];
    NSString *num=[NSString stringWithFormat:@"%d",number];
    [NSString labelString:_leftLab font:[UIFont systemFontOfSize:13] range:NSMakeRange(2, num.length) color:systemColor];
}

@end
