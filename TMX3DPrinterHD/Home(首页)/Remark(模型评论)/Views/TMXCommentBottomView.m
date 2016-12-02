//
//  TMXCommentBottomView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXCommentBottomView.h"

@interface TMXCommentBottomView ()
@property (nonatomic, strong)UIButton *faceIcon;
@property (nonatomic, strong)UIButton *imageIcon;
@property (nonatomic, strong)UITextField *inputContent;
@property (nonatomic, strong)UIButton *publish;
@end
@implementation TMXCommentBottomView

-(UIButton *)faceIcon
{
    if (!_faceIcon) {
        _faceIcon = [UIButton new];
        [_faceIcon setImage:[UIImage imageNamed:@"ExpressionIcon"] forState:UIControlStateNormal];
        [_faceIcon addTarget:self action:@selector(selectFaceIcon) forControlEvents:UIControlEventTouchUpInside];
    }
    return _faceIcon;
}

-(UIButton *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [UIButton new];
        [_imageIcon setImage:[UIImage imageNamed:@"SelecctPic"] forState:UIControlStateNormal];
        [_imageIcon addTarget:self action:@selector(selectImageIcon) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageIcon;
}

-(UITextField *)inputContent
{
    if (!_inputContent) {
        _inputContent = [UITextField new];
        _inputContent.layer.cornerRadius = 5;
        _inputContent.layer.masksToBounds = YES;
        _inputContent.layer.borderColor = systemColor.CGColor;
        _inputContent.layer.borderWidth = 1;
    }
    return _inputContent;
}

-(UIButton *)publish
{
    if (!_publish) {
        _publish = [UIButton new];
        _publish.backgroundColor = systemColor;
        _publish.titleLabel.font = [UIFont systemFontOfSize:13];
        _publish.layer.cornerRadius = 5;
        _publish.layer.masksToBounds = YES;
        [_publish setTitle:@"发表" forState:UIControlStateNormal];
        [_publish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _publish;
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
    [self addSubview:self.faceIcon];
    [self addSubview:self.imageIcon];
    [self addSubview:self.inputContent];
    [self addSubview:self.publish];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_faceIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_imageIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_faceIcon.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_publish mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [_inputContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_publish.mas_left).with.offset(-8);
        make.left.equalTo(_imageIcon.mas_right).with.offset(15);
        make.height.mas_equalTo(@(30));
    }];
}

//选择表情
- (void)selectFaceIcon
{
    
}

//选择图片
- (void)selectImageIcon
{
    
}

@end
