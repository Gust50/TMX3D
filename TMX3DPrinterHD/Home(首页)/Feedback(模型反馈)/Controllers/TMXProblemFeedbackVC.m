//
//  TMXProblemFeedbackVC.m
//  TMX3DPrinter
//
//  Created by wutaobo on 16/9/18.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXProblemFeedbackVC.h"
#import "TMXHeadView.h"
#import "TMXProblemFeedbackCell.h"
#import "TMXHomeModelDetailModel.h"
#import "TMXFeedbackBottomView.h"
#import "TMXFeedbackModel.h"

@interface TMXProblemFeedbackVC ()<UITableViewDelegate, UITableViewDataSource,TMXFeedbackBottomViewDelegate>
{
    TMXFeedbackModel *model;                    ///<反馈意见列表
    NSMutableDictionary *feedbackParams;
    NSInteger pageNum;
    
    TMXHomeAddReviewModel *feedbackModel;       ///<反馈意见
    NSMutableDictionary *params;                ///<传入参数
}

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) TMXFeedbackBottomView *feedbackBottomView;

@end

@implementation TMXProblemFeedbackVC
static NSString *const cellID=@"TMXProblemFeedbackCell";
static NSString *const headerID=@"TMXHeadView";

#pragma mark - lazyLoad
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = backGroundColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(TMXFeedbackBottomView *)feedbackBottomView{
    
    if (!_feedbackBottomView) {
        _feedbackBottomView=[[TMXFeedbackBottomView alloc]initWithFrame:CGRectZero];
        _feedbackBottomView.delegate = self;
//        NSString *_feedback_content = NSLocalizedString(@"Feedback_content", nil);
        _feedbackBottomView.placeholder = @"请输入反馈内容";
//        NSString *_feedback = NSLocalizedString(@"Feedback", nil);
        _feedbackBottomView.btnContent = @"提交";
    }
    return _feedbackBottomView;
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
    self.view.backgroundColor = backGroundColor;
//    NSString *_problemfeedback = NSLocalizedString(@"Problemfeedback", nil);
    [self.navigationItem setTitle:@"模型反馈"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.feedbackBottomView];
    
    [self.tableView registerClass:[TMXProblemFeedbackCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[TMXHeadView class] forHeaderFooterViewReuseIdentifier:headerID];
    self.tableView.tableFooterView = [UIView new];
    
    feedbackModel = [[TMXHomeAddReviewModel alloc] init];
    params = [NSMutableDictionary dictionary];
    model = [TMXFeedbackModel new];
    feedbackParams = [NSMutableDictionary dictionary];
//    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    self.tableView.mj_footer.hidden=YES;
//    [self.tableView.mj_header beginRefreshing];
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

#pragma mark - loadData
- (void)loadNewData
{
    pageNum = 1;
    feedbackParams[@"pageNumber"] = @(pageNum);
    feedbackParams[@"pageSize"] = @(10);
    feedbackParams[@"modelId"] = @(self.modelId);
    [model FetchTMXFeedbackModel:feedbackParams callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            model = result;
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:model.modelList];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            if (model.modelList.count < 10) {
                self.tableView.mj_footer.hidden = YES;
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else
            {
                self.tableView.mj_footer.hidden = NO;
                [self.tableView.mj_footer resetNoMoreData];
            }
        }else
        {
            [self.tableView.mj_header endRefreshing];
        }
    
    }];
    
}

//加载更多数据
- (void)loadMoreData
{
    pageNum++;
    params[@"pageNumber"] = @(pageNum);
    if (pageNum > model.pageNumber) {
        [model FetchTMXFeedbackModel:params callBack:^(BOOL isSuccess, id result) {
            if (isSuccess) {
                model = result;
                [self.dataSource addObjectsFromArray:model.modelList];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
                
                if (model.modelList.count < 10) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else
                {
                    [self.tableView.mj_footer endRefreshing];
                }
            }
        }];
    }else
    {
        [self.tableView.mj_footer endRefreshing];
    }
}

- (void)loadData
{
    params[@"userId"] = [FetchAppPublicKeyModel shareAppPublicKeyManager].infoModel.userId;
    params[@"modelId"] = @(self.modelId);
    params[@"type"] = @(2);
    [feedbackModel FetchTMXHomeAddReviewModel:params callBack:^(BOOL isSuccess, id result) {
        if (isSuccess) {
            [MBProgressHUD showSuccess:NSLocalizedString(@"Feed_Suc", nil)];
            [self loadNewData];
        }else
        {
            [MBProgressHUD showError:NSLocalizedString(@"Feed_Fail", nil)];
        }
    }];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    WS(weakSelf);
    if (Lanscape) {
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.height.mas_equalTo(@(ScreenLH-49));
        }];
        [_feedbackBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
            make.height.mas_equalTo(@(49));
        }];
        
    }else
    {
        [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top).with.offset(0);
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.height.mas_equalTo(@(ScreenPH-49));
        }];
        [_feedbackBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
            make.height.mas_equalTo(@(49));
        }];
    }
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.view setNeedsUpdateConstraints];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMXProblemFeedbackCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TMXProblemFeedbackCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.listModel = [self.dataSource objectAtIndexCheck:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TMXHeadView *headerView = [TMXHeadView new];
    headerView.describe = @"共有231位用户反馈了问题";
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TMXFeedbackListModel *listModel = self.dataSource[indexPath.row];
//    CGSize size = [NSString sizeWithStr:listModel.comment font:[UIFont systemFontOfSize:12*AppScale] width:SCREENWIDTH-20*AppScale];
    return 60 + 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

#pragma mark <TMXFeedbackBottomViewDelegate>
-(void)TMXFeedbackBottomView:(NSString *)content textField:(UITextField *)textField{
    params[@"comment"] = content;
//    [self loadData];
    [self.view endEditing:YES];
    textField.text = nil;
}

#pragma mark - setter getter
-(void)setModelId:(NSInteger)modelId
{
    _modelId = modelId;
}

@end
