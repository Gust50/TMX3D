//
//  TMXProfileVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXProfileVC.h"
#import "TMXProfileSegmentCell.h"
#import "TMXProfileHeaderView.h"
#import "TMXNotLoginView.h"
#import "TMXLoginHeaderView.h"
#import "TMXUploadModelCell.h"
#import "TMXHomeDisplayModelCell.h"
#import "TMXNullModelView.h"
#import "TMXAppLoginView.h"
#import "TMXmyMessageController.h"
#import "AppDelegate.h"
#import "TMXBgLoginVC.h"
#import "TMXBgSetupVC.h"
#import "TMXBgInfoSetupVC.h"

@interface TMXProfileVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TMXProfileHeaderViewDelegate, TMXLoginHeaderViewDelegate, TMXProfileSegmentCellDelegate>
{
    NSInteger selectTag;    ///<选择哪个模型
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) TMXProfileHeaderView *headerView;         ///<未登录头部
@property (nonatomic, strong) TMXProfileSegmentCell *segmentView;       ///<选择控件
@property (nonatomic, strong) TMXNotLoginView *notLoginView;            ///<未登录尾部
@property (nonatomic, strong) TMXLoginHeaderView *loginHeaderView;      ///<登录头部
@property (nonatomic, strong) TMXNullModelView *nullModelView;           ///<无上传模型

@property (nonatomic,strong) TMXAppLoginView *appLoginView;

@property (nonatomic, strong) TMXBgLoginVC *loginVC;
@property (nonatomic, strong) TMXBgSetupVC *bgSetupVC;
@property (nonatomic, strong) TMXBgInfoSetupVC *bgInfoSetupVC;
@end

@implementation TMXProfileVC
static NSString *const uploadModelID = @"TMXUploadModelCell";
static NSString *const modelCellID=@"modelCellID";

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = backGroundColor;
    }
    return _collectionView;
}

-(TMXProfileHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [TMXProfileHeaderView new];
        _headerView.delegate = self;
    }
    return _headerView;
}

-(TMXProfileSegmentCell *)segmentView
{
    if (!_segmentView) {
        _segmentView = [TMXProfileSegmentCell new];
        _segmentView.delegate = self;
    }
    return _segmentView;
}

-(TMXNotLoginView *)notLoginView
{
    if (!_notLoginView) {
        _notLoginView = [TMXNotLoginView new];
    }
    return _notLoginView;
}

-(TMXLoginHeaderView *)loginHeaderView
{
    if (!_loginHeaderView) {
        _loginHeaderView = [TMXLoginHeaderView new];
        _loginHeaderView.delegate = self;
    }
    return _loginHeaderView;
}

-(TMXNullModelView *)nullModelView
{
    if (!_nullModelView) {
        _nullModelView = [TMXNullModelView new];
    }
    return _nullModelView;
}

- (TMXAppLoginView *)appLoginView{
    if (!_appLoginView) {
        _appLoginView = [[TMXAppLoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    }
    return _appLoginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor = backGroundColor;
    self.loginVC=[TMXBgLoginVC new];
    self.bgSetupVC=[TMXBgSetupVC new];
    self.bgInfoSetupVC=[TMXBgInfoSetupVC new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTopView) name:@"removeController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeSetupVC) name:@"removeController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeInfoSetupVC) name:@"removeInfoController" object:nil];

    //register
    [_collectionView registerClass:[TMXUploadModelCell class] forCellWithReuseIdentifier:uploadModelID];
    [_collectionView registerClass:[TMXHomeDisplayModelCell class] forCellWithReuseIdentifier:modelCellID];
    
    [self.view addSubview:self.segmentView];
    selectTag = 1;

    //登录状态

    if ([FetchAppPublicKeyModel shareAppPublicKeyManager].isLogin) {

        [self.view addSubview:self.loginHeaderView];
        //有模型
        [self.view addSubview:self.collectionView];
        //无模型
//        [self.view addSubview:self.nullModelView];
    }else
    {
         [self.view addSubview:self.headerView];
         [self.view addSubview:self.notLoginView];
        [self loginAppVC];

        WS(weakSelf);
        //立即登录
        self.notLoginView.tMXNotLoginViewBlock = ^(){
            [weakSelf loginAppVC];
        };
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuc) name:@"loginSuc" object:nil];

}

//登录成功
- (void)loginSuc
{
//    [self.view addSubview:self.segmentView];
//    selectTag = 1;
//    if ([FetchAppPublicKeyModel shareAppPublicKeyManager].isLogin) {
//        [self.view addSubview:self.loginHeaderView];
//        //有模型
//        [self.view addSubview:self.collectionView];
//        //无模型
//        //        [self.view addSubview:self.nullModelView];
//    }else
//    {
//        [self.view addSubview:self.headerView];
//        [self.view addSubview:self.notLoginView];
//        [self loginAppVC];
//        
//        WS(weakSelf);
//        //立即登录
//        self.notLoginView.tMXNotLoginViewBlock = ^(){
//            [weakSelf loginAppVC];
//        };
//    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

     [_collectionView reloadData];
    self.segmentView.isUpdateUI = YES;
    self.notLoginView.isUpdateUI = YES;
    _appLoginView.isUpdateUI=YES;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TMXUploadModelCell *uploadModelCell=[collectionView dequeueReusableCellWithReuseIdentifier:uploadModelID forIndexPath:indexPath];
     TMXHomeDisplayModelCell *modelCell=[collectionView dequeueReusableCellWithReuseIdentifier:modelCellID forIndexPath:indexPath];
    if (selectTag == 1) {
        return uploadModelCell;
    }else
    {
        return modelCell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (Lanscape) {
        return CGSizeMake((_collectionView.width-10)/3, 300);
    }else{
        return CGSizeMake((_collectionView.width-5)/2, 300);
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


-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    WS(weakSelf);
    if (Lanscape) {
//        NSLog(@"屏幕横");
        if ([FetchAppPublicKeyModel shareAppPublicKeyManager].isLogin) {
            
            [_loginHeaderView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
                make.height.mas_equalTo(@(150));
            }];
            [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_loginHeaderView.mas_bottom);
                make.height.mas_equalTo(@(60));
            }];
            
            [_nullModelView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_segmentView.mas_bottom);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
            }];
            
            [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_segmentView.mas_bottom);
                make.left.equalTo(weakSelf.view.mas_left);
                make.right.equalTo(weakSelf.view.mas_right);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
            }];

        }else
        {
            [_headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
                make.height.mas_equalTo(@(250));
            }];
            [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_headerView.mas_bottom);
                make.height.mas_equalTo(@(60));
            }];
            
            [_notLoginView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_segmentView.mas_bottom);
                make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
            }];
            
            [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_segmentView.mas_bottom);
                make.left.equalTo(weakSelf.view.mas_left);
                make.right.equalTo(weakSelf.view.mas_right);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
                
            }];

            _appLoginView.frame=CGRectMake(0, 0, ScreenW, ScreenH);
        }
        
    }else
    {
//        NSLog(@"屏幕竖");
        if ([FetchAppPublicKeyModel shareAppPublicKeyManager].isLogin) {
            [_loginHeaderView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
                make.height.mas_equalTo(@(150));
            }];
            [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_loginHeaderView.mas_bottom);
                make.height.mas_equalTo(@(60));
            }];
            
            [_nullModelView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_segmentView.mas_bottom);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
            }];
            [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_segmentView.mas_bottom);
                make.left.equalTo(weakSelf.view.mas_left);
                make.right.equalTo(weakSelf.view.mas_right);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
                
            }];
            
        }else
        {
            [_headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(weakSelf.view.mas_top).with.offset(64);
                make.height.mas_equalTo(@(250));
            }];
            [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_headerView.mas_bottom);
                make.height.mas_equalTo(@(60));
            }];
            
            [_notLoginView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(weakSelf.view);
                make.top.equalTo(_segmentView.mas_bottom);
                make.bottom.equalTo(weakSelf.view);
            }];
            
            [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_segmentView.mas_bottom);
                make.left.equalTo(weakSelf.view.mas_left);
                make.right.equalTo(weakSelf.view.mas_right);
                make.bottom.equalTo(weakSelf.view.mas_bottom);
        
            }];

            _appLoginView.frame=CGRectMake(0, 0, ScreenW, ScreenH);

        }
    }
    [_collectionView reloadData];
    
}

#pragma mark <TMXProfileHeaderViewDelegate>
-(void)clickSetup:(TMXProfileHeaderView *)headView
{
//    NSLog(@"clickSetup");
}

-(void)clickLogin:(TMXProfileHeaderView *)headView
{
    [self loginAppVC];
    NSLog(@"clickLogin");
}

#pragma mark <TMXLoginHeaderViewDelegate>
-(void)clickMessage:(TMXLoginHeaderView *)loginHeaderView
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    TMXmyMessageController *messageController = [[TMXmyMessageController alloc] init];
    [self.navigationController pushViewController:messageController animated:YES];
}

- (void)clickSetUp:(TMXLoginHeaderView *)loginHeaderView
{
    [self setupVC];
}

-(void)clickPersonSetp:(TMXLoginHeaderView *)loginHeaderView
{
    [self setupInfoVC];
}

#pragma mark <TMXProfileSegmentCellDelegate>
-(void)clickTag:(NSInteger)tag
{
    selectTag = tag;
    [_collectionView reloadData];
}

//移除登录视图
- (void)removeTopView
{
    [self.loginVC.view removeFromSuperview];
}

//登录
-(void)loginAppVC{
    
    WS(weakSelf);
    [ShareApp.window addSubview:_loginVC.view];
    weakSelf.loginVC.view.bounds=[UIScreen mainScreen].bounds;
    
    _loginVC.removeBgBlock=^{
        [weakSelf.loginVC.view removeFromSuperview];
    };
}

-(void)setupVC{
    WS(weakSelf);
    [ShareApp.window addSubview:_bgSetupVC.view];
    weakSelf.bgSetupVC.view.bounds=[UIScreen mainScreen].bounds;
    
    _bgSetupVC.removeBgSetupBlock=^{
        [weakSelf.bgSetupVC.view removeFromSuperview];
    };
}

-(void)setupInfoVC{
    WS(weakSelf);
    [ShareApp.window addSubview:_bgInfoSetupVC.view];
    weakSelf.bgInfoSetupVC.view.bounds=[UIScreen mainScreen].bounds;
    
    _bgInfoSetupVC.removeBgSetupBlock=^{
        [weakSelf.bgInfoSetupVC.view removeFromSuperview];
    };
}

//移除设置控制器
- (void)removeSetupVC
{
    [self.bgSetupVC .view removeFromSuperview];
}

- (void)removeInfoSetupVC
{
    [self.bgInfoSetupVC.view removeFromSuperview];
}

-(void)keyboardWillHide:(NSNotification *)notification{
    NSDictionary* info = [notification userInfo];
    
    //kbSize即为键盘尺寸 (有width, height)
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    //得到键盘的高度
    
    CGFloat keyboardhight=kbSize.height;
    
    //设置动画的名字
    
    [UIView beginAnimations:@"AnimationOpen" context:nil];
    
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    
    //使用当前正在运行的状态开始下一段动画
    
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    //设置视图移动的位移
    
    _loginVC.view.frame = CGRectMake(0, 0 ,_loginVC.view.width, _loginVC.view.height-keyboardhight);
    
    //设置动画结束
    [UIView commitAnimations];
}


- (void)keyboardWillShow:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    
    //kbSize即为尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    //得到键盘的高度
    CGFloat keyboardhight=kbSize.height;
    
    //设置动画的名字
    [UIView beginAnimations:@"AnimationOpen" context:nil];
    
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    
    //使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    //设置视图移动的位移
    _loginVC.view.frame = CGRectMake(0, 0 - keyboardhight, ScreenW, ScreenH+keyboardhight);
    
    //设置动画结束
    [UIView commitAnimations];
}

@end
