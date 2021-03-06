//
//  TMXPrinterVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterVC.h"
#import "AppDelegate.h"
#import "TMXPrinterHeadView.h"
#import "TMXPrinterListTableViewCell.h"
#import "TMXBindPrinterSelectionView.h"
#import "TMXUnBindPrinterSelectionView.h"
#import "TMXMotifyPrinterNameView.h"
#import "TMXShareUserListViewController.h"
#import "TMXSharePrinterView.h"
#import "TMXSharePrinterTaskListViewController.h"
#import "TMXBindPrinterTaskListViewController.h"
#import "TMXAddPrinterVC.h"
#import "TMXremoveBindPrinterView.h"
#import "TMXSelectUserView.h"
#import "TMXPrinterControlVC.h"


@interface TMXPrinterVC ()<UITableViewDelegate,UITableViewDataSource,BindPrinterSelectionCellSelectDelegate,unBindPrinterSelectionCellSelectDelegate,TMXAddPrinterVCDelegate,removeBindPrinterDelegate>{

    NSInteger Ltag;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TMXBindPrinterSelectionView *bindPrinterSelectionView;
@property (nonatomic, strong) TMXUnBindPrinterSelectionView *unBindPrinterSelectionView;
@property (nonatomic, strong) TMXMotifyPrinterNameView *motifyPrinterNameView; //修改备注
@property (nonatomic, strong) TMXSharePrinterView *sharePrinterView;  //分享打印机

@property (nonatomic, strong) TMXAddPrinterVC *addPrinterVC;
@property (nonatomic, strong) TMXremoveBindPrinterView *removeBindPrinterView;//解除绑定
@end

@implementation TMXPrinterVC

static NSString * const TMXPrinterListHeadViewID = @"TMXPrinterListHeadViewID";
static NSString * const TMXPrinterListCellID = @"TMXPrinterListCellID";

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
//        _tableView.layoutMargins = UIEdgeInsetsZero;
//        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
    }
    return _tableView;
}

- (TMXBindPrinterSelectionView *)bindPrinterSelectionView{

    if (!_bindPrinterSelectionView) {
        _bindPrinterSelectionView = [[TMXBindPrinterSelectionView alloc] initWithFrame:CGRectZero];
        _bindPrinterSelectionView.delegate = self;
    }
    return _bindPrinterSelectionView;
}

-(TMXUnBindPrinterSelectionView *)unBindPrinterSelectionView{

    if (!_unBindPrinterSelectionView) {
        _unBindPrinterSelectionView = [[TMXUnBindPrinterSelectionView alloc] initWithFrame:CGRectZero];
        _unBindPrinterSelectionView.delegate = self;
    }
    return _unBindPrinterSelectionView;
}

- (TMXMotifyPrinterNameView *)motifyPrinterNameView{
    
    if (!_motifyPrinterNameView) {
        _motifyPrinterNameView = [[TMXMotifyPrinterNameView alloc] initWithFrame:CGRectZero];
    }
    return _motifyPrinterNameView;
}

- (TMXSharePrinterView *)sharePrinterView{

    if (!_sharePrinterView) {
        _sharePrinterView = [[TMXSharePrinterView alloc] initWithFrame:CGRectZero];
    }
    return _sharePrinterView;
}

- (TMXremoveBindPrinterView *)removeBindPrinterView{

    if (!_removeBindPrinterView) {
        _removeBindPrinterView = [[TMXremoveBindPrinterView alloc] initWithFrame:CGRectZero];
        _removeBindPrinterView.delegate = self;
    }
    return _removeBindPrinterView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
    //notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstCellNotif:) name:@"notificationRemoveBindPrinterView" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstCellNotif:) name:@"notificationRemoveUnbindPrinterView" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstCellNotif:) name:@"notificationRemoveSharePtinterView" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstCellNotif:) name:@"notificationRemoveMotifyPrinterNameView" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstCellNotif:) name:@"notificationRemoveReleaseBindPrinterView" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    UIBarButtonItem *item=[UIBarButtonItem normalImage:@"Add_Printer" selectImage:@"Add_Printer" target:self action:@selector(addPrinter)];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeBackground) name:@"removeController" object:nil];
    self.navigationItem.rightBarButtonItem=item;
}

-(void)addPrinter{
    
    self.addPrinterVC=[TMXAddPrinterVC new];
    _addPrinterVC.delegate=self;
    _addPrinterVC.view.bounds=[UIScreen mainScreen].bounds;
     [ShareApp.window addSubview:_addPrinterVC.view];
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
//    [self updateViewConstraints];
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    [_tableView reloadData];
}


#pragma mark <notification>
- (void)firstCellNotif:(NSNotification *)notif{

    Ltag = 0;
    [self.bindPrinterSelectionView removeFromSuperview];
    [self.unBindPrinterSelectionView removeFromSuperview];
    [self.sharePrinterView removeFromSuperview];
    [self.motifyPrinterNameView removeFromSuperview];
    [self.removeBindPrinterView removeFromSuperview];
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
    
    _addPrinterVC.view.frame = CGRectMake(0, 0 ,_addPrinterVC.view.width, _addPrinterVC.view.height-keyboardhight);
    
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
    _addPrinterVC.view.frame = CGRectMake(0, 0 - keyboardhight, ScreenW, ScreenH+keyboardhight);
    
    //设置动画结束
    [UIView commitAnimations];
}


#pragma mark <init ui>
- (void)initUI{

    self.navigationItem.title = @"打印机列表";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[TMXPrinterHeadView class] forHeaderFooterViewReuseIdentifier:TMXPrinterListHeadViewID];
    [self.tableView registerClass:[TMXPrinterListTableViewCell class] forCellReuseIdentifier:TMXPrinterListCellID];
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TMXPrinterHeadView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TMXPrinterListHeadViewID];
    if (!headView) {
        headView = [[TMXPrinterHeadView alloc] initWithReuseIdentifier:TMXPrinterListHeadViewID];
    }
    headView.headLabel.text = @"已绑定打印机";
//    if (printerListModel.printerList.count && printerListModel.sharePrinterList.count) {
//        if (section == 0) {
//            
//            headView.headLabel.text = @"已绑定打印机";
//            
//        }else{
//            
//            headView.headLabel.text = @"已共享打印机";
//        }
//    }else if (printerListModel.printerList.count && !printerListModel.sharePrinterList.count)
//    {
//        headView.headLabel.text = @"已绑定打印机";
//        
//    }else if (!printerListModel.printerList.count && printerListModel.sharePrinterList.count)
//    {
//        headView.headLabel.text = @"已共享打印机";
//    }
    return headView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TMXPrinterListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TMXPrinterListCellID];
    if (!cell) {
        cell = [[TMXPrinterListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:TMXPrinterListCellID];
    }
//    cell.separatorInset = UIEdgeInsetsZero;
//    cell.layoutMargins = UIEdgeInsetsZero;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        Ltag = 1;
        [self.unBindPrinterSelectionView removeFromSuperview];
        [ShareApp.window addSubview:self.bindPrinterSelectionView];
//        _bindPrinterSelectionView.isUpdateAnimation=YES;
        [_bindPrinterSelectionView useAnimation];
        [self updateViewConstraints];
        
    }else{
        Ltag = 2;
        [self.bindPrinterSelectionView removeFromSuperview];
        [ShareApp.window addSubview:self.unBindPrinterSelectionView];
        [_unBindPrinterSelectionView useAnimation];
        [self updateViewConstraints];
    }
}

#pragma mark <BindPrinterSelectionDelegate>

-(void)goPrinterCenter{
    [self removeBackground];
    [_bindPrinterSelectionView removeFromSuperview];
    TMXPrinterControlVC *printerControlVC=[TMXPrinterControlVC new];
    [self.navigationController pushViewController:printerControlVC animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
    
}

- (void)sharePrinter{
    //分享打印机
    Ltag = 4;
    [self.bindPrinterSelectionView removeFromSuperview];
    [ShareApp.window addSubview:self.sharePrinterView];
    [self updateViewConstraints];
}

- (void)goMotifyName{
    //修改备注
    Ltag = 3;
    [self.bindPrinterSelectionView removeFromSuperview];
    [self.unBindPrinterSelectionView removeFromSuperview];
    [ShareApp.window addSubview:self.motifyPrinterNameView];
    [self updateViewConstraints];
}

- (void)goTaskList{
    //任务列表
    Ltag = 0;
    [self.bindPrinterSelectionView removeFromSuperview];
    TMXBindPrinterTaskListViewController * BindPrinterTaskListVC = [[TMXBindPrinterTaskListViewController alloc] init];
    [self.navigationController pushViewController:BindPrinterTaskListVC animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
}

- (void)shareUserList{
    //分享用户列表
    [self.bindPrinterSelectionView removeFromSuperview];
    [self.unBindPrinterSelectionView removeFromSuperview];
    TMXShareUserListViewController * shareUserListVC = [[TMXShareUserListViewController alloc] init];
    [self.navigationController pushViewController:shareUserListVC animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
}

- (void)resetPrinterWifi{
    //重设打印机wifi
    [self.bindPrinterSelectionView removeFromSuperview];
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil message:@"确认重设打印机wifi?" preferredStyle:(UIAlertControllerStyleAlert)];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)removeBindPrinter{
    //解除绑定
    Ltag = 5;
    [self.bindPrinterSelectionView removeFromSuperview];
    [ShareApp.window addSubview:self.removeBindPrinterView];
    [self updateViewConstraints];
}

#pragma mark <unBindPrinterSelectionCellSelectDelegate>
- (void)goUnBindPrintertaskList{
    //任务列表
    Ltag = 0;
    [self.unBindPrinterSelectionView removeFromSuperview];
    TMXSharePrinterTaskListViewController * sharePrinterTaskListVC = [[TMXSharePrinterTaskListViewController alloc] init];
    [self.navigationController pushViewController:sharePrinterTaskListVC animated:YES];
}
- (void)motifyUnBindPtinterName{
    //修改备注
    Ltag = 3;
    [self.bindPrinterSelectionView removeFromSuperview];
    [self.unBindPrinterSelectionView removeFromSuperview];
    [ShareApp.window addSubview:self.motifyPrinterNameView];
    [self updateViewConstraints];
}
- (void)removeSharePrinter{
    //解除绑定
    [self.unBindPrinterSelectionView removeFromSuperview];
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:nil message:@"确认解除此打印机" preferredStyle:(UIAlertControllerStyleAlert)];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    if (Ltag == 1) {
        [_bindPrinterSelectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }else if(Ltag == 2){
    
        [_unBindPrinterSelectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }else if (Ltag == 3){
    
        [_motifyPrinterNameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }else if (Ltag == 4){
    
        [_sharePrinterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }else if (Ltag == 5){
    
        [_removeBindPrinterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }

}


-(void)removeBackground{
    [_addPrinterVC.view removeFromSuperview];
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
