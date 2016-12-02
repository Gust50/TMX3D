//
//  TMXModelSearchVC.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXModelSearchVC.h"
#import "TMXSearchNavigationView.h"
#import "TMXSearchHistoryCell.h"
#import "TMXHomeDisplayModelCell.h"
#import "TMXSearchHistoryHeader.h"
#import "TMXDetailVC.h"
#import "TMXHomeSearchModel.h"

@interface TMXModelSearchVC ()<TMXSearchNavigationViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, TMXSearchHistoryHeaderDelegate>
{
    BOOL isSearchResult;                ///<判断是否显示搜索结果
    TMXHomeSearchModel *searchModel;    ///<搜索模型
    NSMutableDictionary *params;        ///<传入参数
    NSString *searchName;               ///<需要搜索的模型名
}
@property (nonatomic, strong) TMXSearchNavigationView *nav;
@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation TMXModelSearchVC
static NSString *const historyID = @"TMXSearchHistoryCell";
static NSString *const displayModelID = @"TMXHomeDisplayModelCell";
static NSString *const headerID = @"TMXSearchHistoryHeader";

-(TMXSearchNavigationView *)nav
{
    if (!_nav) {
        _nav = [[TMXSearchNavigationView alloc] initWithFrame:CGRectZero];
        _nav.delegate = self;
    }
    return _nav;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[UICollectionViewFlowLayout new];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.nav;
    [self.view addSubview:self.collectionView];
    searchModel = [[TMXHomeSearchModel alloc] init];
    params = [NSMutableDictionary dictionary];
    isSearchResult = NO;
    [_collectionView registerClass:[TMXSearchHistoryCell class] forCellWithReuseIdentifier:historyID];
    [_collectionView registerClass:[TMXHomeDisplayModelCell class] forCellWithReuseIdentifier:displayModelID];
    [_collectionView registerClass:[TMXSearchHistoryHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

#pragma mark - loadData
- (void)loadData
{
    params[@"keywords"] = searchName;
    [searchModel FetchTMXHomeSearchModel:params callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            searchModel = result;
            [self.collectionView reloadData];
        }else
        {
            [MBProgressHUD showError:result];
        }
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (isSearchResult) {
        return 1;
    }else
    {
         return 2;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (isSearchResult) {
        return searchModel.searchResult.count;
    }else
    {
        return 10;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isSearchResult) {
        TMXHomeDisplayModelCell *displayModelCell = [collectionView dequeueReusableCellWithReuseIdentifier:displayModelID forIndexPath:indexPath];
        displayModelCell.searchListModel = [searchModel.searchResult objectAtIndexCheck:indexPath.item];
        return displayModelCell;
    }else
    {
        TMXSearchHistoryCell *historyCell = [collectionView dequeueReusableCellWithReuseIdentifier:historyID forIndexPath:indexPath];
        return historyCell;
    }
    
    return nil;;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (!isSearchResult) {
        if (indexPath.section == 0) {
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                TMXSearchHistoryHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
                headerView.isHideClearBtn = YES;
                headerView.content = @"热门搜索";
                return headerView;
            }
        }else
        {
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                TMXSearchHistoryHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
                headerView.isHideClearBtn = NO;
                headerView.delegate = self;
                headerView.content = @"历史搜索";
                return headerView;
            }
        }
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isSearchResult) {
        isSearchResult = YES;
        [_collectionView reloadData];
    }else
    {
        TMXHomeSearchListModel *searchListModel = [searchModel.searchResult objectAtIndexCheck:indexPath.item];
        TMXDetailVC *detailVC = [TMXDetailVC new];
        detailVC.modelId = searchListModel.searchID;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isSearchResult) {
        if (Lanscape) {
            return CGSizeMake((_collectionView.width-240)/5, 40);
        }else
        {
            return CGSizeMake((_collectionView.width-200.1)/4, 40);
        }
    }else
    {
        if (Lanscape) {
            return CGSizeMake((_collectionView.width-40.1)/3, 300);
        }else{
            return CGSizeMake((_collectionView.width-30)/2, 300);
        }
    }
}

//row
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (!isSearchResult) {
        return 20;
    }else
    {
        return 10;
    }
    
}

//column
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (!isSearchResult) {
        return 40;
    }else
    {
        return 10;
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (!isSearchResult) {
        if (Lanscape) {
            return UIEdgeInsetsMake(20, 40, 0, 40);
        }else
        {
            return UIEdgeInsetsMake(20, 40, 0, 40);
        }
    }else
    {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (!isSearchResult) {
        if (Lanscape) {
            return CGSizeMake(_collectionView.width, 60);
        }else{
            return CGSizeMake(_collectionView.width, 60);
        }
    }else
    {
        return CGSizeMake(0, 0);
    }
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
//    [_collectionView reloadData];
    
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf)
    if (Lanscape) {
        [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
        _nav.frame = CGRectMake(80, 5, ScreenW-100, 30);
    }else
    {
        [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
        _nav.frame = CGRectMake(80, 5, ScreenW-100, 30);
    }
    if (isSearchResult) {
        _collectionView.backgroundColor=backGroundColor;
    }else
    {
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark <TMXSearchNavigationViewDelegate>
-(void)clickSearchModel:(NSString *)modelName
{
    searchName = modelName;
    isSearchResult = YES;
    [self loadData];
    [self updateViewConstraints];
}

#pragma mark <TMXSearchHistoryHeaderDelegate>
-(void)clickClearAllHistory
{
    NSLog(@"clickClearAllHistory");
}

@end
