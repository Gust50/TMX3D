//
//  TMXClassifyVC.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/1.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXClassifyVC.h"
#import "TMXHomeJqueryHeaderView.h"
#import "TMXHomeDisplayModelCell.h"
#import "TMXHomeClassifyListModel.h"
#import "TMXDetailVC.h"

@interface TMXClassifyVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    TMXHomeClassifyListModel *classifyListModel;    ///<分类展览模型
    NSMutableDictionary *params;    ///<参数
    NSInteger pageNum;              ///<当前页码
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation TMXClassifyVC
static NSString *const jqueryID=@"jqueryID";
static NSString *const modelCellID=@"modelCellID";

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[UICollectionViewFlowLayout new];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.backgroundColor=backGroundColor;
    }
    return _collectionView;
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=backGroundColor;
    [self.view addSubview:self.collectionView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    classifyListModel = [[TMXHomeClassifyListModel alloc] init];
    params = [NSMutableDictionary dictionary];
    pageNum = 1;
    
    //register
    [_collectionView registerClass:[TMXHomeJqueryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:jqueryID];
    [_collectionView registerClass:[TMXHomeDisplayModelCell class] forCellWithReuseIdentifier:modelCellID];
    
    self.collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.collectionView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.collectionView.mj_footer.hidden=YES;
    [self.collectionView.mj_header beginRefreshing];
    
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        
        if (self.isHome) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        }else
        {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma mark - loadData
- (void)loadNewData
{
    pageNum = 1;
    params[@"pageNumber"] = @(pageNum);
    params[@"pageSize"] = @(10);
    params[@"categoryId"] = @(self.categoryId);
    [classifyListModel FetchTMXHomeClassifyListModel:params callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            classifyListModel = result;
//            NSString *str = [NSString stringWithFormat:@"%@模型", classifyListModel.name];
//            [self.navigationItem setTitle:str];
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:classifyListModel.modelList];
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
            
            if (classifyListModel.modelList.count < 10) {
                self.collectionView.mj_footer.hidden = YES;
                [self.collectionView.mj_footer endRefreshingWithNoMoreData];
            }else
            {
                self.collectionView.mj_footer.hidden=NO;
                [self.collectionView.mj_footer resetNoMoreData];
            }
        }else
        {
            [self.collectionView.mj_header endRefreshing];
        }
    }];
    
}

//加载更多数据
-(void)loadMoreData
{
    pageNum++;
    params[@"pageNumber"]=@(pageNum);
    
    if (pageNum <= classifyListModel.totalPage) {
        [classifyListModel FetchTMXHomeClassifyListModel:params callBack:^(BOOL isSuccess, id result){
            
            if (isSuccess) {
                classifyListModel = result;
                [self.dataSource addObjectsFromArray:classifyListModel.modelList];
                [self.collectionView.mj_footer endRefreshing];
                [self.collectionView reloadData];
                
                if (classifyListModel.modelList.count < 10) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }else
                {
                    [self.collectionView.mj_footer endRefreshing];
                }
            }
        }];
    }else
    {
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    }
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.view setNeedsUpdateConstraints];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [_collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TMXHomeDisplayModelCell *modelCell=[collectionView dequeueReusableCellWithReuseIdentifier:modelCellID forIndexPath:indexPath];
    modelCell.clasifyListModel = self.dataSource[indexPath.item];
    return modelCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TMXHomeClassifyListListModel *listModel = [self.dataSource objectAtIndexCheck:indexPath.item];
    TMXDetailVC *detailVC = [TMXDetailVC new];
    detailVC.modelId = listModel.classifyListID;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (Lanscape) {
        return CGSizeMake((_collectionView.width-10.1)/3, 300);
    }else{
        return CGSizeMake((_collectionView.width-5)/2, 300);
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    TMXHomeJqueryHeaderView *jqueryHeaderView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:jqueryID forIndexPath:indexPath];
    NSArray *array = [NSArray arrayWithObjects:classifyListModel.faceImg, nil];
    jqueryHeaderView.jqueryArray = array;
    return jqueryHeaderView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (Lanscape) {
        return CGSizeMake(_collectionView.width, 200);
    }else{
        return CGSizeMake(_collectionView.width, 200);
    }
}


//row
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

//column
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(5, 0, 0, 0);
}

#pragma mark - setter getter
-(void)setCategoryId:(NSInteger)categoryId
{
    _categoryId = categoryId;
}

-(void)setName:(NSString *)name
{
    _name = name;
}

-(void)setIsHome:(BOOL)isHome
{
    _isHome = isHome;
}

@end
