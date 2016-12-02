//
//  TMXModelCommentVC.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXModelCommentVC.h"
#import "TMXHeadView.h"
#import "TMXCommentBottomView.h"
#import "TMXMainReplyCell.h"

@interface TMXModelCommentVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) TMXCommentBottomView *commentBottomView;
@end

@implementation TMXModelCommentVC
static NSString *const headerID=@"TMXHeadView";
static NSString *const remarkID=@"remarkID";

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
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(TMXCommentBottomView *)commentBottomView{
    
    if (!_commentBottomView) {
        _commentBottomView=[[TMXCommentBottomView alloc]initWithFrame:CGRectZero];
    }
    return _commentBottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = backGroundColor;
    [self.navigationItem setTitle:@"模型评论"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.commentBottomView];
    [self.tableView registerClass:[TMXHeadView class] forHeaderFooterViewReuseIdentifier:headerID];
    [_tableView registerClass:[TMXMainReplyCell class] forCellReuseIdentifier:remarkID];
    self.tableView.tableFooterView = [UIView new];
    
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PushChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
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
    TMXMainReplyCell *cell = [tableView dequeueReusableCellWithIdentifier:remarkID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TMXHeadView *headerView = [TMXHeadView new];
    headerView.describe = @"共有231位用户参与了评论";
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
        [_commentBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
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
        [_commentBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
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
    [self updateViewConstraints];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [_tableView reloadData];
}


@end
