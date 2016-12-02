//
//  TMXSharePrinterCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSharePrinterCell.h"

@implementation TMXSharePrinterCell

#pragma mark <lazyLoad>
- (UILabel *)describeLabel{

    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = RGBColor(53, 53, 53);
        _describeLabel.font = [UIFont systemFontOfSize:13];
        _describeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _describeLabel;
}

- (UITextField *)inputTextField{

    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] init];
        _inputTextField.textColor = RGBColor(53, 53, 53);
        _inputTextField.font = [UIFont systemFontOfSize:15];
        _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTextField.backgroundColor = [UIColor whiteColor];
        _inputTextField.layer.masksToBounds = YES;
        _inputTextField.layer.cornerRadius = 5;
    }
    return _inputTextField;
}

- (UILabel *)lastLabel{

    if (!_lastLabel) {
        _lastLabel = [[UILabel alloc] init];
        _lastLabel.textColor = RGBColor(53, 53, 53);
        _lastLabel.font = [UIFont systemFontOfSize:13];
    }
    return _lastLabel;
}

- (UILabel *)attentionLabel{

    if (!_attentionLabel) {
        _attentionLabel = [[UILabel alloc] init];
        _attentionLabel.textColor = RGBColor(103, 103, 103);
        _attentionLabel.font = [UIFont systemFontOfSize:10];
    }
    return _attentionLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
        self.backgroundColor = RGBColor(237, 237, 237);
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.describeLabel];
    [self addSubview:self.inputTextField];
    [self addSubview:self.lastLabel];
    [self addSubview:self.attentionLabel];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.top.equalTo(weakSelf.mas_top).with.offset(20);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];
    
    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_describeLabel.mas_right).with.offset(5);
        make.centerY.equalTo(_describeLabel.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@200);
    }];
    
    [_lastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputTextField.mas_right).with.offset(3);
        make.centerY.equalTo(_inputTextField.mas_centerY);
    }];
    
    [_attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_inputTextField.mas_left);
        make.right.equalTo(weakSelf.mas_right).with.offset(-8);
        make.top.equalTo(_inputTextField.mas_bottom).with.offset(5);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
