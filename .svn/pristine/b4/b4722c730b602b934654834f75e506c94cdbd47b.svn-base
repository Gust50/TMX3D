//
//  TMXmyMessageController.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXmyMessageController.h"
#import "TMXcommentFromMessageCell.h"
#import "TMXleftViewFromMessageCell.h"

@interface TMXmyMessageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//<<<<<<< .mine
//=======
//
//@property(nonatomic,strong)UIView *modelCommentView;
//@property(nonatomic,strong)UIImageView *modelCommentImageV;
//@property(nonatomic,strong)UILabel *modelCommentLabel;
//@property(nonatomic,strong)UIImageView *modelCommentNewImageV;
//>>>>>>> .r12675

@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UICollectionView *commentCollectionView;
@property(nonatomic,strong)UILabel *headerTimeLabel;
@property(nonatomic,strong)TMXleftViewFromMessageCell *lelfView;
@end

static NSString *const cellID = @"cellID";
static NSString *const headerID = @"headerID";

@implementation TMXmyMessageController

- (TMXleftViewFromMessageCell *)lelfView{
    if (!_lelfView) {
        _lelfView = [[TMXleftViewFromMessageCell alloc] init];
    }
    return _lelfView;
}
- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
    }
    return _rightView;
}
- (UICollectionView *)commentCollectionView{
    if (!_commentCollectionView) {
       
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _commentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _commentCollectionView.delegate = self;
        _commentCollectionView.dataSource = self;
        _commentCollectionView.showsVerticalScrollIndicator = NO;
        _commentCollectionView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
      
    }
    return _commentCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
//<<<<<<< .mine
//    self.title = @"我的消息";
//    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
//        [self backAC];
//    }];
//    [self configureRightBarButtonWithTitle:nil icon:@"WriteMessage" action:^{
//        [self editAC];
//    }];
//=======

    UIImage *editImage = [[UIImage imageNamed:@"WriteMessage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:editImage style:UIBarButtonItemStylePlain target:self action:@selector(editAC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    

       UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"return_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAC)];
    
       UIBarButtonItem *leftTitle = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAC)];
       leftTitle.tintColor = [UIColor grayColor];
    
        self.navigationItem.leftBarButtonItems = @[leftBtn,leftTitle];
    
    
    [self configureLeftBarButtonWithTitle:nil icon:nil action:^{
        
    }];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 40,10 , 80, 20)];
    label.textColor = [UIColor blackColor];
    label.text = @"我的消息";
    label.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = label;
//>>>>>>> .r12675
    [self initUI];
   
}

- (void)initUI{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    [self.view addSubview:self.lelfView];
    [self.view addSubview:self.rightView];
    [self.rightView addSubview:self.commentCollectionView];
    [_commentCollectionView registerClass:[TMXcommentFromMessageCell class] forCellWithReuseIdentifier:cellID];
    [_commentCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    
    self.commentCollectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.commentCollectionView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.commentCollectionView.mj_footer.hidden = YES;
    [self.commentCollectionView.mj_header beginRefreshing];
    
    [self updateViewConstraints];
    
}
- (void)loadNewData{
    [self.commentCollectionView reloadData];
    [self.commentCollectionView.mj_header endRefreshing];
}
- (void)loadMoreData{
    [self.commentCollectionView reloadData];
      self.commentCollectionView.mj_footer.hidden = NO;
//      [self.commentCollectionView.mj_footer endRefreshingWithNoMoreData];
//    [self.commentCollectionView.mj_footer endRefreshing];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 30;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    TMXcommentFromMessageCell *commentCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    commentCell.backgroundColor = [UIColor whiteColor];
    return commentCell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *header;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
         header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
      
        _headerTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _rightView.width, 40)];
        
       
        _headerTimeLabel.text = @"13:52";
        _headerTimeLabel.textAlignment = NSTextAlignmentCenter;
        _headerTimeLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
        _headerTimeLabel.font = [UIFont systemFontOfSize:15];
        [header addSubview:self.headerTimeLabel];
    }
    return header;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (Lanscape) {
        NSLog(@"啊");
       return CGSizeMake(_rightView.width - 40, 150);
    }else{
        NSLog(@"呀");
      return CGSizeMake(_rightView.width- 40, 130);
    }
   
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
        return CGSizeMake(_commentCollectionView.width, 50);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(25, 15, 0, 20);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
//<<<<<<< .mine
//=======
//    [_modelCommentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.view.mas_top).offset(69);
//        make.left.equalTo(weakSelf.view.mas_left);
//        make.size.mas_offset(CGSizeMake([UIScreen mainScreen].bounds.size.width/3,[UIScreen mainScreen].bounds.size.height/8));
//    }];
//    
//    [_modelCommentImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_modelCommentView.mas_left).offset(40*APPScale);
//        make.centerY.equalTo(_modelCommentView.mas_centerY);
//        make.size.mas_equalTo(CGSizeMake(50*APPScale, 50*APPScale));
//    }];
//    [_modelCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_modelCommentImageV.mas_right).offset(20*APPScale);
//        make.centerY.equalTo(_modelCommentView.mas_centerY);
//        make.size.mas_offset(CGSizeMake(100*APPScale, 20*APPScale));
//    }];
//    [_modelCommentNewImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(_modelCommentView.mas_right).offset(-60*APPScale);
//        make.centerY.equalTo(_modelCommentView.mas_centerY);
//>>>>>>> .r12675

        [_lelfView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.equalTo(weakSelf.view);
            make.top.equalTo(weakSelf.view.mas_top).offset(69);
            make.width.equalTo(@(ScreenW*1/3));
        }];
        [_rightView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(weakSelf.view);
            //        make.width.equalTo(@(ScreenW*2/3));
            make.left.equalTo(_lelfView.mas_right);
        }];
        [_commentCollectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(weakSelf.view);
            make.width.equalTo(@(ScreenW*2/3));
            make.top.equalTo(weakSelf.view.mas_top).offset(30);
       }];
    

}
- (void)editAC{
    //编辑
}
- (void)backAC{
   
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSLog(@"正确的✅"); [_commentCollectionView reloadData];
    [self updateViewConstraints];
   
}
@end
