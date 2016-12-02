//
//  TMXSharePrinterTaskListViewController.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/3.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSharePrinterTaskListViewController.h"
#import "TMXSharePrinterTaskListTableViewCell.h"

@interface TMXSharePrinterTaskListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TMXSharePrinterTaskListViewController

static NSString *const shareTaskListCellID = @"shareTaskListCellID";

#pragma mark <lazyLoad>
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
    }
    return _tableView;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self updateViewConstraints];
}

#pragma mark <life Cycle>
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI{

    self.navigationItem.title = @"任务列表";
    self.view.backgroundColor = RGBColor(228, 233, 234);;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.tableView registerClass:[TMXSharePrinterTaskListTableViewCell class] forCellReuseIdentifier:shareTaskListCellID];
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
}

#pragma mark <uitable view delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXSharePrinterTaskListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:shareTaskListCellID];
    if (!cell) {
        cell = [[TMXSharePrinterTaskListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:shareTaskListCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark <更新约束>
-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(15, 0, 0, 0));
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
