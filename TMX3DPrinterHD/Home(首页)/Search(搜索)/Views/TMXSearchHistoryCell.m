//
//  TMXSearchHistoryCell.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSearchHistoryCell.h"

@interface TMXSearchHistoryCell ()

@property (nonatomic, strong)UILabel *modelName;

@end
@implementation TMXSearchHistoryCell

-(UILabel *)modelName
{
    if (!_modelName) {
        _modelName = [UILabel new];
        _modelName.layer.cornerRadius = 15;
        _modelName.layer.masksToBounds = YES;
        _modelName.layer.borderWidth = 1;
        _modelName.layer.borderColor = systemColor.CGColor;
        _modelName.text = @"熊出没";
        _modelName.textColor = systemColor;
        _modelName.textAlignment = NSTextAlignmentCenter;
        _modelName.userInteractionEnabled = YES;
    }
    return _modelName;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.modelName];
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    
    [_modelName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end
