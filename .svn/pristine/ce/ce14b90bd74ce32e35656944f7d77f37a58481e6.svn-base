//
//  TMXFeedbackSuggestCell.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/14.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFeedbackSuggestCell.h"

@interface TMXFeedbackSuggestCell ()<UITextViewDelegate>
@property (nonatomic, strong)UILabel *describe;
@property (nonatomic, strong)UITextView *textView;
@property (nonatomic, strong)UILabel *placeHolder;
@end
@implementation TMXFeedbackSuggestCell

-(UILabel *)describe
{
    if (!_describe) {
        _describe = [UILabel new];
        _describe.text = @"请留下您宝贵的建议，我们将努力改进（限200字）";
        _describe.font = [UIFont systemFontOfSize:12];
    }
    return _describe;
}

-(UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.backgroundColor = RGBColor(250, 250, 250);
        _textView.layer.cornerRadius = 5;
        _textView.layer.masksToBounds = YES;
        _textView.layer.borderWidth = 1;
        _textView.layer.borderColor = RGBColor(234, 234, 234).CGColor;
        _textView.delegate = self;
    }
    return _textView;
}

- (UILabel *)placeHolder
{
    if (!_placeHolder) {
        _placeHolder = [UILabel new];
        _placeHolder.font = [UIFont systemFontOfSize:11];
        _placeHolder.textColor = [UIColor lightGrayColor];
        _placeHolder.text = @"请输入反馈内容";
        _placeHolder.hidden = NO;
    }
    return _placeHolder;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.describe];
        [self addSubview:self.textView];
        [self.textView addSubview:self.placeHolder];
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_describe mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(@(15));
    }];
    [_textView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_describe.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-10);
    }];
    [_placeHolder mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textView.mas_top).with.offset(8);
        make.left.equalTo(_textView.mas_left).with.offset(5);
        make.right.equalTo(_textView.mas_right).with.offset(-5);
        make.height.mas_equalTo(@(15));
    }];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length == 0) {
        _placeHolder.hidden = NO;
    }else
    {
        _placeHolder.hidden = YES;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSuggest:)]) {
        [self.delegate clickSuggest:self.textView.text];
    }
}

//设置textView的placeholder
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
