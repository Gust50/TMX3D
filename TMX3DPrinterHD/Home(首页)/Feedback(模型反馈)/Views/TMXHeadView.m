//
//  TMXHeadView.m
//  TMX3DPrinter
//
//  Created by wutaobo on 16/9/19.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHeadView.h"

@interface TMXHeadView ()

@property (nonatomic, strong)UILabel *content;

@end
@implementation TMXHeadView


#pragma mark - lazyLoad

-(UILabel *)content
{
    if (!_content) {
        _content = [UILabel new];
        _content.text = @"共有182位用户反馈了问题";
        _content.font = [UIFont systemFontOfSize:13];
        _content.textColor = RGBColor(126, 126, 126);
    }
    return _content;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = RGBColor(246, 245, 246);
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.content];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.mas_equalTo(@(15));
    }];
    
}

#pragma mark setter getter
-(void)setDescribe:(NSString *)describe
{
    _describe = describe;
//    NSScanner *scanner = [NSScanner scannerWithString:describe];
//    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
//    
//    int number;
//    [scanner scanInt:&number];
//    NSString *num=[NSString stringWithFormat:@"%d",number];
//    [NSString labelString:_subContent font:[UIFont systemFontOfSize:10*AppScale] range:NSMakeRange(self.leng.length, num.length) color:systemColor];

}

@end
