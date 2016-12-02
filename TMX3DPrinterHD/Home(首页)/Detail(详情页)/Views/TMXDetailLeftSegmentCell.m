//
//  TMXDetailLeftSegmentCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXDetailLeftSegmentCell.h"
#import "KBtopImgBottomTextBtn.h"
#import "TMXHomeDetailBrowseView.h"
#import "TMXHomeModelDetailModel.h"

@interface TMXDetailLeftSegmentCell ()<KBtopImgBottomTextBtnDelegate>
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) KBtopImgBottomTextBtn *likeBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *collectBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *remarkBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *feedBackBtn;
@property (nonatomic, strong) TMXHomeDetailBrowseView *browseBtn;
@property (nonatomic, strong) UIView *lineOne;
@property (nonatomic, strong) UIView *lineTwo;
@property (nonatomic, strong) UIView *lineThree;
@property (nonatomic, strong) UIView *lineFour;
@end

@implementation TMXDetailLeftSegmentCell

-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.userInteractionEnabled = YES;
    }
    return _backView;
}

-(UIView *)lineOne
{
    if (!_lineOne) {
        _lineOne = [UIView new];
        _lineOne.backgroundColor = RGBColor(248, 248, 248);
    }
    return _lineOne;
}

-(UIView *)lineTwo
{
    if (!_lineTwo) {
        _lineTwo = [UIView new];
        _lineTwo.backgroundColor = RGBColor(248, 248, 248);
    }
    return _lineTwo;
}

-(UIView *)lineThree
{
    if (!_lineThree) {
        _lineThree = [UIView new];
        _lineThree.backgroundColor = RGBColor(248, 248, 248);
    }
    return _lineThree;
}

-(UIView *)lineFour
{
    if (!_lineFour) {
        _lineFour = [UIView new];
        _lineFour.backgroundColor = RGBColor(248, 248, 248);
    }
    return _lineFour;
}

-(KBtopImgBottomTextBtn *)likeBtn{
    if (!_likeBtn) {
        _likeBtn=[KBtopImgBottomTextBtn new];
        _likeBtn.delegate = self;
        _likeBtn.btnTag = 1;
        _likeBtn.iconUrl = @"Like_normal";
        _likeBtn.nameContent = @"喜欢(123)";
        _likeBtn.textColor = RGBColor(124, 124, 124);
        _likeBtn.textFont = [UIFont systemFontOfSize:12];
    }
    return _likeBtn;
}

-(KBtopImgBottomTextBtn *)collectBtn{
    if (!_collectBtn) {
        _collectBtn=[KBtopImgBottomTextBtn new];
        _collectBtn.delegate = self;
        _collectBtn.btnTag = 2;
        _collectBtn.iconUrl = @"Collect_select";
        _collectBtn.nameContent = @"收藏(123)";
        _collectBtn.textColor = RGBColor(124, 124, 124);
        _collectBtn.textFont = [UIFont systemFontOfSize:12];
    }
    return _collectBtn;
}

-(KBtopImgBottomTextBtn *)remarkBtn{
    if (!_remarkBtn) {
        _remarkBtn=[KBtopImgBottomTextBtn new];
        _remarkBtn.delegate = self;
        _remarkBtn.btnTag = 3;
        _remarkBtn.iconUrl = @"Remark_gray";
        _remarkBtn.nameContent = @"评论(123)";
        _remarkBtn.textColor = RGBColor(124, 124, 124);
        _remarkBtn.textFont = [UIFont systemFontOfSize:12];
    }
    return _remarkBtn;
}

-(KBtopImgBottomTextBtn *)feedBackBtn{
    if (!_feedBackBtn) {
        _feedBackBtn=[KBtopImgBottomTextBtn new];
        _feedBackBtn.delegate = self;
        _feedBackBtn.iconUrl = @"FeedBack_icon";
        _feedBackBtn.btnTag = 4;
        _feedBackBtn.nameContent = @"反馈(0)";
        _feedBackBtn.textColor = RGBColor(124, 124, 124);
        _feedBackBtn.textFont = [UIFont systemFontOfSize:12];
    }
    return _feedBackBtn;
}

-(TMXHomeDetailBrowseView *)browseBtn{
    if (!_browseBtn) {
        _browseBtn=[TMXHomeDetailBrowseView new];
        _browseBtn.backgroundColor = [UIColor redColor];
    }
    return _browseBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.backView];
    [self.backView addSubview:self.likeBtn];
    [self.backView addSubview:self.collectBtn];
    [self.backView addSubview:self.remarkBtn];
    [self.backView addSubview:self.feedBackBtn];
    [self.backView addSubview:self.browseBtn];
    [self.backView addSubview:self.lineOne];
    [self.backView addSubview:self.lineTwo];
    [self.backView addSubview:self.lineThree];
    [self.backView addSubview:self.lineFour];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_backView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_likeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).with.offset(5);
        make.left.equalTo(_backView.mas_left);
        make.bottom.equalTo(_backView.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(weakSelf.width/5));
    }];
    
    [_collectBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).with.offset(5);
        make.left.equalTo(_likeBtn.mas_right);
        make.bottom.equalTo(_backView.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(weakSelf.width/5));
    }];
    
    [_remarkBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).with.offset(5);
        make.left.equalTo(_collectBtn.mas_right);
        make.bottom.equalTo(_backView.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(weakSelf.width/5));
    }];
    
    [_feedBackBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).with.offset(5);
        make.left.equalTo(_remarkBtn.mas_right);
        make.bottom.equalTo(_backView.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(weakSelf.width/5));
    }];
    
    [_browseBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(_feedBackBtn.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.mas_equalTo(@(weakSelf.width/5));
    }];
    
    [_lineOne mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_likeBtn.mas_top).with.offset(5);
        make.left.equalTo(_likeBtn.mas_right);
        make.bottom.equalTo(_likeBtn.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(1));
    }];
    
    [_lineTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectBtn.mas_top).with.offset(5);
        make.left.equalTo(_collectBtn.mas_right);
        make.bottom.equalTo(_collectBtn.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(1));
    }];
    
    [_lineThree mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_remarkBtn.mas_top).with.offset(5);
        make.left.equalTo(_remarkBtn.mas_right);
        make.bottom.equalTo(_remarkBtn.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(1));
    }];
    
    [_lineFour mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_feedBackBtn.mas_top).with.offset(5);
        make.left.equalTo(_feedBackBtn.mas_right);
        make.bottom.equalTo(_feedBackBtn.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(@(1));
    }];
}

#pragma mark - setter getter
-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    if (isUpdateUI) {
        [self setNeedsUpdateConstraints];
    }
}

-(void)setDetailModel:(TMXHomeModelDetailModel *)detailModel
{
    _detailModel = detailModel;
    _browseBtn.browseCount = detailModel.viewCnt;
    _likeBtn.nameContent = [NSString stringWithFormat:@"喜欢(%ld)", detailModel.upvoteCnt];
    _collectBtn.nameContent = [NSString stringWithFormat:@"收藏(%ld)", detailModel.favoriteCnt];
    _remarkBtn.nameContent = [NSString stringWithFormat:@"评论(%ld)", detailModel.modelCommentCount];
    if (detailModel.isUpvoteModel) {
        _likeBtn.iconUrl = @"Collect_select";
    }else
    {
        _likeBtn.iconUrl = @"Like_normal";
    }
    if (detailModel.isFavoriteModel) {
        _collectBtn.iconUrl = @"Collect_select";
    }else
    {
        _collectBtn.iconUrl = @"Collect_normal";
    }
    
//    _feedBackBtn.nameContent = [NSString stringWithFormat:@"反馈(%ld)", detailModel.upvoteCnt];
}

#pragma mark <KBtopImgBottomTextBtnDelegate>
-(void)clickBtnTag:(NSInteger)btnTag
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickSegmentTag:)]) {
        [self.delegate clickSegmentTag:btnTag];
    }
}

@end
