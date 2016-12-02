//
//  TMXleftViewFromMessage.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/10.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXleftViewFromMessageCell.h"
#define LeftTitleColor     [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define RightTitleColor    [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0]
@interface TMXleftViewFromMessageCell()
@property(nonatomic,strong)UIView *modelCommentView;
@property(nonatomic,strong)UIImageView *modelCommentImageV;
@property(nonatomic,strong)UILabel *modelCommentLabel;
@property(nonatomic,strong)UIImageView *modelCommentNewImageV;

@property(nonatomic,strong)UIView *modelRepeatView;
@property(nonatomic,strong)UIImageView *modelRepeatImageV;
@property(nonatomic,strong)UILabel *modelRepeatLabel;
@property(nonatomic,strong)UIImageView *modelRepeatNewImageV;

@property(nonatomic,strong)UIView *modelPrintView;
@property(nonatomic,strong)UIImageView *modelPrintImageV;
@property(nonatomic,strong)UILabel *modelPrintLabel;
@property(nonatomic,strong)UIImageView *modelPrintNewImageV;

@property(nonatomic,strong)UIView *systemNotificationView;
@property(nonatomic,strong)UIImageView *systemNotificationImageV;
@property(nonatomic,strong)UILabel *systemNotificationLabel;
@property(nonatomic,strong)UIImageView *systemNotificationNewImageV;

@property(nonatomic,strong)UIView *bottomView;
@end
@implementation TMXleftViewFromMessageCell
- (UIView *)modelCommentView{
    if (!_modelCommentView) {
        _modelCommentView = [UIView new];
        _modelCommentView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *commentGecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentGecognizerAC)];
        [_modelCommentView addGestureRecognizer:commentGecognizer];
        
    }
    return _modelCommentView;
}

- (void)commentGecognizerAC{
    NSLog(@"模型评论");
    //模型评论
//    [self.view addSubview:self.commentCollectionView];
    
}
- (UIImageView *)modelCommentImageV{
    if (!_modelCommentImageV) {
        _modelCommentImageV = [UIImageView new];
        _modelCommentImageV.image = [UIImage imageNamed:@"ModelRemark"];
    }
    return _modelCommentImageV;
}
- (UILabel *)modelCommentLabel{
    if (!_modelCommentLabel) {
        _modelCommentLabel = [UILabel new];
        _modelCommentLabel.text = @"模型评论";
        _modelCommentLabel.textColor = LeftTitleColor;
    }
    return _modelCommentLabel;
}
- (UIImageView *)modelCommentNewImageV{
    if (!_modelCommentNewImageV) {
        _modelCommentNewImageV = [UIImageView new];
        _modelCommentNewImageV.backgroundColor = [UIColor orangeColor];
        _modelCommentNewImageV.layer.cornerRadius = 5*APPScale;
    }
    return _modelCommentNewImageV;
}


- (UIView *)modelRepeatView{
    if (!_modelRepeatView) {
        _modelRepeatView = [UIView new];
        _modelRepeatView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *repeatGecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(repeatGecognizerAC)];
        [_modelRepeatView addGestureRecognizer:repeatGecognizer];
        
    }
    return _modelRepeatView;
}
- (void)repeatGecognizerAC{
    NSLog(@"模型反馈");
    //模型反馈
}

- (UIImageView *)modelRepeatImageV{
    if (!_modelRepeatImageV) {
        _modelRepeatImageV = [UIImageView new];
        _modelRepeatImageV.image = [UIImage imageNamed:@"ModelFeed"];
    }
    return _modelRepeatImageV;
}
- (UILabel *)modelRepeatLabel{
    if (!_modelRepeatLabel) {
        _modelRepeatLabel = [UILabel new];
        _modelRepeatLabel.text = @"模型反馈";
        _modelRepeatLabel.textColor = LeftTitleColor;
    }
    return _modelRepeatLabel;
}
- (UIImageView *)modelRepeatNewImageV{
    if (!_modelRepeatNewImageV) {
        _modelRepeatNewImageV = [UIImageView new];
        _modelRepeatNewImageV.backgroundColor = [UIColor orangeColor];
        _modelRepeatNewImageV.layer.cornerRadius = 5*APPScale;
    }
    return _modelRepeatNewImageV;
}

- (UIView *)modelPrintView{
    if (!_modelPrintView) {
        _modelPrintView = [UIView new];
        _modelPrintView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *printGecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(printGecognizerAC)];
        [_modelPrintView addGestureRecognizer:printGecognizer];
    }
    return _modelPrintView;
}
- (void)printGecognizerAC{
    NSLog(@"模型打印");
    //模型打印
}
- (UIImageView *)modelPrintImageV{
    if (!_modelPrintImageV) {
        _modelPrintImageV = [UIImageView new];
        _modelPrintImageV.image = [UIImage imageNamed:@"ModelPrint"];
    }
    return _modelPrintImageV;
}
- (UILabel *)modelPrintLabel{
    if (!_modelPrintLabel) {
        _modelPrintLabel = [UILabel new];
        _modelPrintLabel.text = @"模型打印";
        _modelPrintLabel.textColor = LeftTitleColor;
    }
    return _modelPrintLabel;
}
- (UIImageView *)modelPrintNewImageV{
    if (!_modelPrintNewImageV) {
        _modelPrintNewImageV = [UIImageView new];
        _modelPrintNewImageV.backgroundColor = [UIColor orangeColor];
        _modelPrintNewImageV.layer.cornerRadius = 5*APPScale;
    }
    return _modelPrintNewImageV;
}

- (UIView *)systemNotificationView{
    if (!_systemNotificationView) {
        _systemNotificationView = [UIView new];
        _systemNotificationView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *systemNotificationGecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(systemNotificationGecognizerAC)];
        [_systemNotificationView addGestureRecognizer:systemNotificationGecognizer];
    }
    return _systemNotificationView;
}
- (void)systemNotificationGecognizerAC{
    NSLog(@"系统通知");
    //系统通知
}
- (UIImageView *)systemNotificationImageV{
    if (!_systemNotificationImageV) {
        _systemNotificationImageV = [UIImageView new];
        _systemNotificationImageV.image = [UIImage imageNamed:@"SystemNoti"];
    }
    return _systemNotificationImageV;
}
- (UILabel *)systemNotificationLabel{
    if (!_systemNotificationLabel) {
        _systemNotificationLabel = [UILabel new];
        _systemNotificationLabel.text = @"系统通知";
        _systemNotificationLabel.textColor = LeftTitleColor;
    }
    return _systemNotificationLabel;
}
- (UIImageView *)systemNotificationNewImageV{
    if (!_systemNotificationNewImageV) {
        _systemNotificationNewImageV = [UIImageView new];
        _systemNotificationNewImageV.backgroundColor = [UIColor orangeColor];
        _systemNotificationNewImageV.layer.cornerRadius = 5*APPScale;
    }
    return _systemNotificationNewImageV;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _isAppearNewComment = NO;
    _isAppearNewRepeat = YES;
    _isAppearNewPrint = YES;
    _isAppearNewNotification = NO;
    
    [self addSubview:self.modelCommentView];
    [self.modelCommentView addSubview:self.modelCommentImageV];
    [self.modelCommentView addSubview:self.modelCommentLabel];
    if (_isAppearNewComment) {
        [self.modelCommentView addSubview:self.modelCommentNewImageV];
    }
    
    [self addSubview:self.modelRepeatView];
    [self.modelRepeatView addSubview:self.modelRepeatImageV];
    [self.modelRepeatView addSubview:self.modelRepeatLabel];
    if (_isAppearNewRepeat) {
        [self.modelRepeatView addSubview:self.modelRepeatNewImageV];
    }
    [self addSubview:self.modelPrintView];
    [self.modelPrintView addSubview:self.modelPrintImageV];
    [self.modelPrintView addSubview:self.modelPrintLabel];
    if (_isAppearNewPrint) {
        [self.modelPrintView addSubview:self.modelPrintNewImageV];
    }
    
    
    
    [self addSubview:self.systemNotificationView];
    [self.systemNotificationView addSubview:self.systemNotificationImageV];
    [self.systemNotificationView addSubview:self.systemNotificationLabel];
    if (_isAppearNewNotification) {
        [self.systemNotificationView addSubview:self.systemNotificationNewImageV];
    }
    
    
    [self addSubview:self.bottomView];
    
    [self updateConstraints];
   
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_modelCommentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top).offset(69);
//        make.left.equalTo(weakSelf.mas_left);
//        make.size.mas_offset(CGSizeMake([UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.height/8));
        make.left.right.top.equalTo(weakSelf);
        make.height.equalTo(@(100*APPScale));
    }];
    
    [_modelCommentImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentView.mas_left).offset(40*APPScale);
        make.centerY.equalTo(_modelCommentView.mas_centerY);
        make.size.mas_offset(CGSizeMake(50*APPScale, 50*APPScale));
    }];
    [_modelCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentImageV.mas_right).offset(20*APPScale);
        make.centerY.equalTo(_modelCommentView.mas_centerY);
        make.size.mas_offset(CGSizeMake(100*APPScale, 20*APPScale));
    }];
    [_modelCommentNewImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_modelCommentView.mas_right).offset(-60*APPScale);
        make.centerY.equalTo(_modelCommentView.mas_centerY);
        
        make.size.mas_offset(CGSizeMake(10*APPScale, 10*APPScale));
    }];
    
    [_modelRepeatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_modelCommentView.mas_bottom).offset(2);
        make.left.equalTo(_modelCommentView.mas_left);
        
        make.width.equalTo(_modelCommentView.mas_width);
        make.height.equalTo(_modelCommentView.mas_height);
    }];
    
    [_modelRepeatImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentImageV.mas_left);
        make.centerY.equalTo(_modelRepeatView.mas_centerY);
        make.width.equalTo(_modelCommentImageV.mas_width);
        make.height.equalTo(_modelCommentImageV.mas_height);
    }];
    
    [_modelRepeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentLabel.mas_left);
        make.centerY.equalTo(_modelRepeatView.mas_centerY);
        make.width.equalTo(_modelCommentLabel.mas_width);
        make.height.equalTo(_modelCommentLabel.mas_height);
    }];
    [_modelRepeatNewImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_modelRepeatView.mas_right).offset(-60*APPScale);
        make.centerY.equalTo(_modelRepeatView.mas_centerY);
        make.size.mas_offset(CGSizeMake(10*APPScale, 10*APPScale));
    }];
    
    [_modelPrintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_modelRepeatView.mas_bottom).offset(2);
        make.left.equalTo(_modelCommentView.mas_left);
        make.width.equalTo(_modelCommentView.mas_width);
        make.height.equalTo(_modelCommentView.mas_height);
    }];
    
    [_modelPrintImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentImageV.mas_left);
        make.centerY.equalTo(_modelPrintView.mas_centerY);
        make.width.equalTo(_modelCommentImageV.mas_width);
        make.height.equalTo(_modelCommentImageV.mas_height);
    }];
    
    [_modelPrintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentLabel.mas_left);
        make.centerY.equalTo(_modelPrintView.mas_centerY);
        make.width.equalTo(_modelCommentLabel.mas_width);
        make.height.equalTo(_modelCommentLabel.mas_height);
    }];
    [_modelPrintNewImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_modelPrintView.mas_right).offset(-60*APPScale);
        make.centerY.equalTo(_modelPrintView.mas_centerY);
        make.width.equalTo(_modelRepeatNewImageV.mas_width);
        make.height.equalTo(_modelRepeatNewImageV.mas_height);
    }];
    
    
    [_systemNotificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_modelPrintView.mas_bottom).offset(2);
        make.left.equalTo(_modelCommentView.mas_left);
        make.width.equalTo(_modelCommentView.mas_width);
        make.height.equalTo(_modelCommentView.mas_height);
    }];
    
    [_systemNotificationImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentImageV.mas_left);
        make.centerY.equalTo(_systemNotificationView.mas_centerY);
        make.width.equalTo(_modelCommentImageV.mas_width);
        make.height.equalTo(_modelCommentImageV.mas_height);
    }];
    
    [_systemNotificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_modelCommentLabel.mas_left);
        make.centerY.equalTo(_systemNotificationView.mas_centerY);
        make.width.equalTo(_modelCommentLabel.mas_width);
        make.height.equalTo(_modelCommentLabel.mas_height);
    }];
    [_systemNotificationNewImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_systemNotificationView.mas_right).offset(-60*APPScale);
        make.centerY.equalTo(_systemNotificationView.mas_centerY);
        make.width.equalTo(_modelRepeatNewImageV.mas_width);
        make.height.equalTo(_modelRepeatNewImageV.mas_height);
    }];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.top.equalTo(_systemNotificationView.mas_bottom).offset(2);
        make.width.equalTo(_systemNotificationView.mas_width);
    }];
    
  
    
}


@end
