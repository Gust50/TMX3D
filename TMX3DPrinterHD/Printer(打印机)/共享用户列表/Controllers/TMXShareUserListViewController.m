//
//  TMXShareUserListViewController.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXShareUserListViewController.h"
#import "TMXShareUserListCell.h"
#import "TMXShareUserLisetHeadView.h"

@interface TMXShareUserListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation TMXShareUserListViewController

static NSString *const UserListCellID = @"userListCellID";
static NSString *const UserListHeadViewID = @"UserListHeadViewID";

#pragma mark <lazyLoad>
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
    }
    return _tableView;
}

#pragma mark <layout subViews>
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self updateViewConstraints];
}

#pragma mark <life Cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self initUI];
}

#pragma mark <init UI>
- (void)initUI{

    self.navigationItem.title = @"分享用户列表";
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.tableView registerClass:[TMXShareUserListCell class] forCellReuseIdentifier:UserListCellID];
    [self.tableView registerClass:[TMXShareUserLisetHeadView class] forHeaderFooterViewReuseIdentifier:UserListHeadViewID];
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    
}
#pragma mark <tableview delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    TMXShareUserLisetHeadView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:UserListHeadViewID];
    if (!headView) {
        headView = [[TMXShareUserLisetHeadView alloc] initWithReuseIdentifier:UserListHeadViewID];
    }
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXShareUserListCell * userListCell = [tableView dequeueReusableCellWithIdentifier:UserListCellID];
    if (!userListCell) {
        userListCell = [[TMXShareUserListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:UserListCellID];
    }
    
    return userListCell;
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
