//
//  TMXSearchNavigationView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSearchNavigationView.h"

@interface TMXSearchNavigationView ()<UITextFieldDelegate>

//@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UIButton *searchBtn;
@property (nonatomic, strong)UITextField *searchModel;

@end
@implementation TMXSearchNavigationView

//-(UIImageView *)icon
//{
//    if (!_icon) {
//        _icon = [UIImageView new];
//        _icon.image = [UIImage imageNamed:@"Search_normal"];
//        _icon.userInteractionEnabled=YES;
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(search:)];
//        [_icon addGestureRecognizer:gesture];
//    }
//    return _icon;
//}

-(UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [UIButton new];
        [_searchBtn setImage:[UIImage imageNamed:@"Search_normal"] forState:UIControlStateNormal];
        _searchBtn.highlighted = NO;
        [_searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

-(UITextField *)searchModel
{
    if (!_searchModel) {
        _searchModel = [UITextField new];
        _searchModel.borderStyle = UITextBorderStyleRoundedRect;
        _searchModel.textAlignment = NSTextAlignmentLeft;
        _searchModel.textColor = RGBColor(202, 202, 202);
        _searchModel.layer.cornerRadius = 15;
        _searchModel.layer.masksToBounds = YES;
        
        _searchModel.font = [UIFont systemFontOfSize:13];
        _searchModel.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
        _searchModel.leftViewMode = UITextFieldViewModeAlways;
        _searchModel.placeholder = @"请输入模型名称搜索";
        _searchModel.delegate = self;
        _searchModel.backgroundColor = RGBColor(237, 237, 237);
        
    }
    return _searchModel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.searchModel];
    [self.searchModel addSubview:self.searchBtn];
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_searchModel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
    }];
    
    [_searchBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_searchModel.mas_right).with.offset(0);
        make.centerY.equalTo(_searchModel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
}

#pragma mark <otherResponse>
- (void)search:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSearchModel:)]) {
        [self.delegate clickSearchModel:_searchModel.text];
    }
}

//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}

@end
