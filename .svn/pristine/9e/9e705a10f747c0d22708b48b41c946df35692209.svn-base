//
//  TMXBindPrinterTaskListViewController.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBindPrinterTaskListViewController.h"
#import "KBSegmentView.h"
#import "TMXBindPrinterTaskListTableViewCell.h"
#import "TMXBindPrintingTaskListTableViewCell.h"
#import "TMXPrintedAndCancelPrintTableViewCell.h"
#import "TMXTaskSaveTableViewCell.h"
#import "KBDragTableView.h"

@interface TMXBindPrinterTaskListViewController ()<UITableViewDelegate,UITableViewDataSource,KBSegmentViewDelegate,KBDragTableViewDataSource,KBDragTableViewDelegate>

@property (nonatomic, strong)UISegmentedControl * taskSegment;
@property (nonatomic, strong)KBDragTableView * tableView;
@property (nonatomic, strong)KBSegmentView * selectionBtn;
@property (nonatomic, strong)UIView * backView;

@end

@implementation TMXBindPrinterTaskListViewController

static NSString *const waitPrinterCellID= @"waitPrinterCellID";
static NSString *const printingCellID = @"printingCellID";
static NSString *const printedAndcencelPrintCellID = @"printedAndcencelPrintCellID";
static NSString *const taskSaveCellID = @"taskSaveCellID";

#pragma mark <lazyLoad>
- (UISegmentedControl *)taskSegment{

    if (!_taskSegment) {
        _taskSegment = [[UISegmentedControl alloc] initWithItems:@[@"打印任务",@"存档任务"]];
        _taskSegment.layer.frame = CGRectMake(0, 0, 250, 40);
        _taskSegment.layer.borderWidth = 1;
        _taskSegment.layer.borderColor = systemColor.CGColor;
        _taskSegment.tintColor = systemColor;
        _taskSegment.layer.masksToBounds = YES;
        _taskSegment.layer.cornerRadius = 8;
        _taskSegment.selectedSegmentIndex = 0;
        [_taskSegment addTarget:self action:@selector(selectTak:) forControlEvents:(UIControlEventValueChanged)];
    }
    return _taskSegment;
}

- (KBDragTableView *)tableView{

    if (!_tableView) {
        _tableView = [[KBDragTableView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.tableFooterView = [[KBDragTableView alloc] init];
    }
    return _tableView;
}

- (KBSegmentView *)selectionBtn{

    if (!_selectionBtn) {
        _selectionBtn = [KBSegmentView createSegmentFrame:CGRectZero segmentTitleArr:@[@"待打印",@"打印中",@"已打印",@"已取消"] backgroundColor:[UIColor whiteColor] titleColor:RGBColor(53, 53, 53) selectTitleColor:systemColor titleFont:[UIFont systemFontOfSize:14] bottomLineColor:systemColor isVerticleBar:NO delegate:self];
        _selectionBtn.selectNum = 0;
    }
    return _selectionBtn;
}

- (UIView *)backView{

    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectZero];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (void)viewWillLayoutSubviews{

    [super viewWillLayoutSubviews];
    
    [self adjustView];
}

#pragma mark <life cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self initUI];
}

#pragma mark <initUI>
- (void)initUI{

    self.view.backgroundColor = RGBColor(228, 233, 234);;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[TMXBindPrinterTaskListTableViewCell class] forCellReuseIdentifier:waitPrinterCellID];
    [self.tableView registerClass:[TMXBindPrintingTaskListTableViewCell class] forCellReuseIdentifier:printingCellID];
    [self.tableView registerClass:[TMXPrintedAndCancelPrintTableViewCell class] forCellReuseIdentifier:printedAndcencelPrintCellID];
    [self.tableView registerClass:[TMXTaskSaveTableViewCell class] forCellReuseIdentifier:taskSaveCellID];
    self.navigationItem.titleView = self.taskSegment;
    [self.view addSubview:self.tableView];
   
    [self adjustView];
}

- (void)adjustView{

    if (self.taskSegment.selectedSegmentIndex == 0) {
        if (Lanscape) {
            
            self.backView.frame = CGRectMake(0, 65, ScreenW, 50);
            self.selectionBtn.frame = CGRectMake(ScreenW/2-200, 0, 400, 50);
            self.tableView.frame = CGRectMake(0, 130, ScreenW, ScreenH-120);
            
        }else{
            self.selectionBtn.frame = CGRectMake(ScreenW/2-200, 0, 400, 50);
            self.backView.frame = CGRectMake(0, 65, ScreenW, 50);
            self.tableView.frame = CGRectMake(0, 130, ScreenW, ScreenH-120);
        }
        [self.backView addSubview:self.selectionBtn];
         [self.view addSubview:self.backView];
    }else{
    
        if (self.backView) {
            [self.backView removeFromSuperview];
        }
        if (Lanscape) {
            self.tableView.frame = CGRectMake(0, 80, ScreenW, ScreenLH-80);
        }else{
        
            self.tableView.frame = CGRectMake(0, 80, ScreenW, ScreenPH-80);
        }
        
    }
    
    
}

#pragma mark <segment action>
- (void)selectTak:(UISegmentedControl *)seg{

    NSLog(@"点击了%zi",seg.selectedSegmentIndex);
    [self viewWillLayoutSubviews];
    [self.tableView reloadData];
}

#pragma mark <KBSegmentViewDelegate>
- (void)selectSegment:(NSInteger)index{

    NSLog(@"=======:%zi",index);
    self.selectionBtn.selectNum = index;
    [self.tableView reloadData];
}
#pragma mark <tableView delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXBindPrinterTaskListTableViewCell * waitingPrinterCell = [tableView dequeueReusableCellWithIdentifier:waitPrinterCellID];
    TMXBindPrintingTaskListTableViewCell * printingCell = [tableView dequeueReusableCellWithIdentifier:printingCellID];
    TMXPrintedAndCancelPrintTableViewCell * printedAndCancelPrintCell = [tableView dequeueReusableCellWithIdentifier:printedAndcencelPrintCellID];
    TMXTaskSaveTableViewCell * taskSaveCell = [tableView dequeueReusableCellWithIdentifier:taskSaveCellID];
    if (!waitingPrinterCell) {
        waitingPrinterCell = [[TMXBindPrinterTaskListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:waitPrinterCellID];
    }
    if (!printingCell) {
        printingCell = [[TMXBindPrintingTaskListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:printingCellID];
    }
    if (!printedAndCancelPrintCell) {
        printedAndCancelPrintCell = [[TMXPrintedAndCancelPrintTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:printedAndcencelPrintCellID];
    }
    if (!taskSaveCell) {
        taskSaveCell = [[TMXTaskSaveTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:taskSaveCellID];
    }
    
    if (self.taskSegment.selectedSegmentIndex == 0) {
        if (self.selectionBtn.selectNum == 0) {
            return waitingPrinterCell;
        }else if (self.selectionBtn.selectNum == 1){
        
            return printingCell;
        }else if (self.selectionBtn.selectNum == 2){
        
            return printedAndCancelPrintCell;
        }else{
        
            return printedAndCancelPrintCell;
        }
    }else{
    
        return taskSaveCell;
    }
    
    
    return nil;
}

//-(NSArray *)originalDataSource:(KBDragTableView *)tableView{
//    return _dataSource;
//}
//
//-(void)tableView:(KBDragTableView *)tableView newDataSource:(NSArray *)dataSource{
//    [_dataSource removeAllObjects];
//    [_dataSource addObjectsFromArray:dataSource];
//    [_tableView reloadData];
//}
//
//-(void)touchEndMoving:(KBDragTableView *)tableView fromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
//    
//    TMXPrinterTaskListListModel *fromModel=[self.dataSource objectAtIndexCheck:fromIndexPath.row];
//    TMXPrinterTaskListListModel *toModel=[self.dataSource objectAtIndexCheck:toIndexPath.row];
//    updateOrderParams[@"id"] = @(fromModel.taskId);
//    updateOrderParams[@"nextId"] = @(toModel.taskId);
//    [updatePrinterOrderModel FetchTMXUpdatePrinterOrderModel:updateOrderParams callBack:^(BOOL isSuccess, id result) {
//        if (isSuccess) {
//            [MBProgressHUD showSuccess:result];
//        }else
//        {
//            [MBProgressHUD showError:result];
//        }
//    }];
//}

@end
