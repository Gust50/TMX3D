//
//  TMXHomeVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/20.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeVC.h"
#import "TMXHomLeftTabBar.h"
#import "TMXHomeJqueryHeaderView.h"
#import "TMXHomeHeaderView.h"
#import "TMXHomeScrollViewCell.h"
#import "TMXHomeDisplayModelCell.h"
#import "TMXHomeDisplayAdvertCell.h"
#import "TMXHomeScrollView3DCell.h"
#import "TMXHomeModel.h"
#import "TMXHomeBackHeaderView.h"
#import "TMXAdvertiseWebVC.h"
#import "TMXClassifyVC.h"
#import "TMXDetailVC.h"
#import "TMXHomeNavigationView.h"
#import "TMXModelSearchVC.h"

@interface TMXHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TMXHomLeftTabBarDelegate,TMXHomeJqueryHeaderViewDelegate, TMXHomeScrollViewCellDelegate, TMXHomeHeaderViewDelegate, TMXHomeNavigationViewDelegate>
{
    TMXHomeModel *homeModel;        ///<首页
    MBProgressHUD *hud;
    
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) TMXHomLeftTabBar *leftTabBar;
@property (nonatomic, strong) TMXHomeNavigationView *nav;
@end

@implementation TMXHomeVC
static NSString *const jqueryID=@"jqueryID";
static NSString *const headerID=@"headerID";
static NSString *const modelCellID=@"modelCellID";
static NSString *const scrollID=@"scrollID";
static NSString *const advertID=@"advertID";
static NSString *const design3DID=@"design3DID";
static NSString *const backGroundID=@"backGroundID";


#pragma mark <lazyLoad>
-(TMXHomLeftTabBar *)leftTabBar{
    if (!_leftTabBar) {
        _leftTabBar=[TMXHomLeftTabBar new];
        _leftTabBar.delegate=self;
    }
    return _leftTabBar;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[UICollectionViewFlowLayout new];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.backgroundColor = backGroundColor;
    }
    return _collectionView;
}

-(TMXHomeNavigationView *)nav
{
    if (!_nav) {
        _nav = [[TMXHomeNavigationView alloc] initWithFrame:CGRectZero];
        _nav.delegate = self;
        _nav.content = NSTextAlignmentCenter;
    }
    return _nav;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=backGroundColor;
    homeModel=[TMXHomeModel new];
    [self.view addSubview:self.collectionView];
    
    self.navigationItem.titleView = self.nav;
    
    //register
    [_collectionView registerClass:[TMXHomeJqueryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:jqueryID];
    [_collectionView registerClass:[TMXHomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    [_collectionView registerClass:[TMXHomeBackHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:backGroundID];
    [_collectionView registerClass:[TMXHomeScrollViewCell class] forCellWithReuseIdentifier:scrollID];
    [_collectionView registerClass:[TMXHomeScrollView3DCell class] forCellWithReuseIdentifier:design3DID];
    [_collectionView registerClass:[TMXHomeDisplayAdvertCell class] forCellWithReuseIdentifier:advertID];
    [_collectionView registerClass:[TMXHomeDisplayModelCell class] forCellWithReuseIdentifier:modelCellID];
    
    hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.backgroundColor=[UIColor clearColor];
    hud.color=[UIColor clearColor];
    hud.activityIndicatorColor=systemColor;
    [self loadData];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dealNotification:) name:@"ScreenRotate" object:nil];
    
}

-(void)dealNotification:(NSNotification *)notificaion{
    NSDictionary *dict=notificaion.userInfo;
    if (dict[@"isRotate"]) {
        NSLog(@"首页旋转");
        [_collectionView setNeedsUpdateConstraints];
        [_collectionView reloadData];
    }
}


-(void)viewWillLayoutSubviews{
    [self updateViewConstraints];
}


-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    if (Lanscape) {
        [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
        
    }else
    {
        [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
    }
     _nav.frame = CGRectMake(30, 5, ScreenW-70-kLeftTabBarPW, 30);
}


-(void)loadData{
    
    [homeModel FetchTMXHomeModel:nil callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            homeModel = result;
            [hud hide:YES];
            [_collectionView reloadData];
            
        }else
        {
            hud.labelText=@"加载失败";
            [hud hide:YES afterDelay:2];
        }
    }];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2+homeModel.categoryModelList.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 1;
    }else{
        TMXHomeCategoryModelListModel *tempModel=homeModel.categoryModelList[section-2];
        return 1+tempModel.modelList.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        TMXHomeScrollViewCell *scrollCell=[collectionView dequeueReusableCellWithReuseIdentifier:scrollID forIndexPath:indexPath];
        scrollCell.homeModel=homeModel;
        scrollCell.delegate = self;
        return scrollCell;
    }else if (indexPath.section==1){
        TMXHomeScrollView3DCell *scroll3DCell=[collectionView dequeueReusableCellWithReuseIdentifier:design3DID forIndexPath:indexPath];
        scroll3DCell.isUpdateUI=YES;
        return scroll3DCell;
    }else{
        if (indexPath.item==0) {
            TMXHomeDisplayAdvertCell *advertCell=[collectionView dequeueReusableCellWithReuseIdentifier:advertID forIndexPath:indexPath];
            TMXHomeCategoryModelListModel *tempModel=[homeModel.categoryModelList objectAtIndexCheck:indexPath.section-2];
            advertCell.advUrl=tempModel.faceImg;
            advertCell.categoryID = tempModel.categoryModelID;
            advertCell.showAdvertiseBlock = ^(NSInteger categoryID){
                [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
                TMXClassifyVC *classifyVC = [TMXClassifyVC new];
                classifyVC.categoryId = categoryID;
                classifyVC.isHome = YES;
                [self.navigationController pushViewController:classifyVC animated:YES];
            };
            return advertCell;
        }else{
            TMXHomeDisplayModelCell *modelCell=[collectionView dequeueReusableCellWithReuseIdentifier:modelCellID forIndexPath:indexPath];
            if (homeModel.categoryModelList.count) {
                TMXHomeCategoryModelListModel *model = homeModel.categoryModelList[indexPath.section-2];
                if (model.modelList.count) {
                    TMXHomeCategoryModelListListModel *listModel = model.modelList[indexPath.item-1];
                    modelCell.categryListModel = listModel;
                }
            }
            return modelCell;
        }
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (Lanscape) {
             return CGSizeMake(_collectionView.width, 200);
        }else{
             return CGSizeMake(_collectionView.width, 200);
        }
        
    }else if (indexPath.section==1){
        if (Lanscape) {
            return CGSizeMake(_collectionView.width, 200);
        }else{
            return CGSizeMake(_collectionView.width, 200);
        }
    }else{
        
        if (Lanscape) {
            if (indexPath.item==0) {
                return CGSizeMake(_collectionView.width, 150);
            }else{
                return CGSizeMake((_collectionView.width-10.1)/3, 300);
            }
        }else{
            if (indexPath.item==0) {
                return CGSizeMake(_collectionView.width, 150);
            }else{
                return CGSizeMake((_collectionView.width-5)/2, 300);
            }
        }
    }
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            TMXHomeJqueryHeaderView *jqueryHeaderView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:jqueryID forIndexPath:indexPath];
            jqueryHeaderView.delegate=self;
            
            NSMutableArray *jqueryArray = [NSMutableArray array];
            for (TMXHomeCarouselListModel *model in homeModel.carouselList) {
                [jqueryArray addObject:model.image];
            }
            jqueryHeaderView.jqueryArray = jqueryArray;
            return jqueryHeaderView;
        }
    }else if (indexPath.section==1){
        
        TMXHomeBackHeaderView *backView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:backGroundID forIndexPath:indexPath];
        return backView;
        
    }else {
        
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            TMXHomeHeaderView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
            if (homeModel.categoryModelList.count) {
                headerView.categoryModelListModel = homeModel.categoryModelList[indexPath.section-2];
            }
            headerView.delegate = self;
            return headerView;
        }
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        if (Lanscape) {
            return CGSizeMake(_collectionView.width, 200);
        }else{
            return CGSizeMake(_collectionView.width, 200);
        }
        
    }else if (section==1){
        if (Lanscape) {
            return CGSizeMake(_collectionView.width, 10);
        }else{
            return CGSizeMake(_collectionView.width, 10);
        }
    }else{
        
        if (Lanscape) {
            return CGSizeMake(_collectionView.width, 40);
        }else{
            return CGSizeMake(_collectionView.width, 40);
        }
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    
    if (indexPath.section==0) {
        
    }else if (indexPath.section==1){
        
    } else {
        if (indexPath.row==0) {
            
        }else{
            TMXDetailVC *detailVC=[TMXDetailVC new];
            TMXHomeCategoryModelListModel *model = homeModel.categoryModelList[indexPath.section-2];
            if (model.modelList.count) {
                TMXHomeCategoryModelListListModel *listModel = model.modelList[indexPath.item-1];
                detailVC.modelId = listModel.listListID;
                detailVC.isHome = YES;
                [self.navigationController pushViewController:detailVC animated:YES];
            }
        }
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

    return UIEdgeInsetsMake(0, 0, 5, 0);
}

#pragma mark <TMXHomLeftTabBarDelegate>
-(void)clickTabBarBtn:(NSString *)name{
    if ([name isEqualToString:@"首页"]) {
        
    }else if ([name isEqualToString:@"打印机"]){
        
    }else if ([name isEqualToString:@"创作"]){
        
    }else{
        
    }
}

#pragma mark <TMXHomeScrollViewCellDelegate>
-(void)clickClassifyList:(NSInteger)categoryID
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    TMXClassifyVC *classifyVC = [TMXClassifyVC new];
    classifyVC.categoryId = categoryID;
    classifyVC.isHome = YES;
    [self.navigationController pushViewController:classifyVC animated:YES];
}

#pragma mark <TMXHomeHeaderViewDelegate>
-(void)clickMoreModel:(NSInteger)categoryID
{
     [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    TMXClassifyVC *classifyVC = [TMXClassifyVC new];
    classifyVC.categoryId = categoryID;
    classifyVC.isHome = YES;
    [self.navigationController pushViewController:classifyVC animated:YES];
}

-(void)clickJquery:(NSInteger)tag{
     [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    NSMutableArray *jqueryArray = [NSMutableArray array];
    for (TMXHomeCarouselListModel *model in homeModel.carouselList) {
        [jqueryArray addObject:model.url];
    }
    TMXAdvertiseWebVC *webVC=[TMXAdvertiseWebVC new];
    webVC.webUrl=[jqueryArray objectAtIndexCheck:tag];
    [self.navigationController pushViewController:webVC animated:YES];
}

-(void)setIsUpdateUI:(BOOL)isUpdateUI{
    if (isUpdateUI) {
        [_collectionView setNeedsUpdateConstraints];
        [_collectionView reloadData];
    }
}

#pragma mark <TMXHomeNavigationViewDelegate>
-(void)selectModel:(TMXHomeNavigationView *)navView
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    TMXModelSearchVC *searchVC = [TMXModelSearchVC new];
    [self.navigationController pushViewController:searchVC animated:YES];
}

@end
