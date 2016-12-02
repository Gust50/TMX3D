//
//  TMXHomeNavigationView.m
//  TMX3DPrinter
//
//  Created by wutaobo on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeNavigationView.h"

@interface TMXHomeNavigationView ()<UITextFieldDelegate>
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UITextField *searchModel;
@end
@implementation TMXHomeNavigationView

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[[UIImageView alloc]init];
        _icon.image = [UIImage imageNamed:@"Search_normal"];
        _icon.userInteractionEnabled=YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(search:)];
        [_icon addGestureRecognizer:gesture];
    }
    return _icon;
}
-(UITextField *)searchModel{
    if (!_searchModel) {
        _searchModel=[[UITextField alloc]init];
        _searchModel.borderStyle = UITextBorderStyleRoundedRect;
        _searchModel.textAlignment = NSTextAlignmentCenter;
        _searchModel.textColor = RGBColor(202, 202, 202);
        _searchModel.layer.cornerRadius = 15;
        _searchModel.layer.masksToBounds = YES;
        
        _searchModel.font = [UIFont systemFontOfSize:13];
        _searchModel.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48, 0)];
        _searchModel.leftViewMode = UITextFieldViewModeAlways;
//        NSString *_input = NSLocalizedString(@"Input_search", nil);
        _searchModel.placeholder = @"请输入模型名称搜索";
        _searchModel.delegate = self;
        _searchModel.backgroundColor = RGBColor(237, 237, 237);
    }
    return _searchModel;
}

#pragma mark <init>
-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}


#pragma mark <add UI>
-(void)initUI{
    [self addSubview:self.searchModel];
    [self.searchModel addSubview:self.icon];
    [self updateConstraints];
}

#pragma mark <otherResponse>
- (void)search:(UITapGestureRecognizer *)tap
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectModel:)]) {
        [self.delegate selectModel:self];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectModel:)]) {
        [self.delegate selectModel:self];
    }
}

#pragma mark <update>
-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    [_searchModel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);

    }];
    
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_searchModel.mas_centerX).with.offset(-48);
        make.centerY.equalTo(_searchModel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(13, 13));
    }];
}

#pragma mark - setter getter
-(void)setContent:(NSTextAlignment)content
{
    _searchModel.textAlignment = content;
}


@end
