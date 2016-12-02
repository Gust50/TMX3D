//
//  TMXMotifyPrinterNameContentView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXMotifyPrinterNameContentView.h"

@implementation TMXMotifyPrinterNameContentView
#pragma mark <lazyLoad>
- (UILabel *)headLabel{

    if (!_headLabel) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor = RGBColor(53, 53, 53);
        _headLabel.font = [UIFont systemFontOfSize:15];
        _headLabel.text = @"备注名称";
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.backgroundColor = RGBColor(246, 246, 246);
    }
    return _headLabel;
}

- (UITextField *)inputTextField{

    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] init];
        _inputTextField.textColor = RGBColor(53, 53, 53);
        _inputTextField.font = [UIFont systemFontOfSize:15];
        _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTextField.backgroundColor = [UIColor whiteColor];
        _inputTextField.placeholder = @" 请输入备注名称";
    }
    return _inputTextField;
}

- (UILabel *)describeLabel{

    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.textColor = RGBColor(102, 102, 102);
        _describeLabel.font = [UIFont systemFontOfSize:12];
        _describeLabel.text = @"备注打印机名称会让你更容易区分打印机";
    }
    return _describeLabel;
}

- (UIButton *)applyBtn{

    if (!_applyBtn) {
        _applyBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_applyBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_applyBtn setBackgroundColor:[UIColor orangeColor]];
        _applyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_applyBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _applyBtn.layer.masksToBounds = YES;
        _applyBtn.layer.cornerRadius = 5;
    }
    return _applyBtn;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = RGBColor(237, 237, 237);
    }
    return self;
}

- (void)initUI{

    [self addSubview:self.headLabel];
    [self addSubview:self.inputTextField];
    [self addSubview:self.describeLabel];
    [self addSubview:self.applyBtn];
    
    [self updateConstraints];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(@50);
    }];
    
    [_inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(_headLabel.mas_bottom).with.offset(10);
        make.height.equalTo(@50);
    }];
    
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(_inputTextField.mas_bottom).with.offset(5);
    }];
    
    [_applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(_describeLabel.mas_bottom).with.offset(30);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.inputTextField resignFirstResponder];
}
@end
