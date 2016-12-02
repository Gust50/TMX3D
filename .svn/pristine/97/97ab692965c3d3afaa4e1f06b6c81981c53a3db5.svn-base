//
//  TMXFeedbackTitleCell.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/14.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFeedbackTitleCell.h"

@interface TMXFeedbackTitleCell ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *leftStr;
@property (nonatomic, strong) UITextField *inputTitle;
@end
@implementation TMXFeedbackTitleCell

-(UILabel *)leftStr
{
    if (!_leftStr) {
        _leftStr = [UILabel new];
        _leftStr.font = [UIFont systemFontOfSize:14];
    }
    return _leftStr;
}

- (UITextField *)inputTitle
{
    if (!_inputTitle) {
        _inputTitle = [UITextField new];
        _inputTitle.font = [UIFont systemFontOfSize:14];
        _inputTitle.delegate = self;
    }
    return _inputTitle;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.leftStr];
        [self addSubview:self.inputTitle];
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_leftStr mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    [_inputTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_leftStr.mas_right);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(30));
    }];
}

#pragma mark - setter getter
-(void)setTitleStr:(NSString *)titleStr
{
    _leftStr.text = titleStr;
}

-(void)setPlacehold:(NSString *)placehold
{
    _inputTitle.placeholder = placehold;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickLeftStr:rightStr:)]) {
        [self.delegate clickLeftStr:_leftStr.text rightStr:_inputTitle.text];
    }
    return YES;
}

@end
