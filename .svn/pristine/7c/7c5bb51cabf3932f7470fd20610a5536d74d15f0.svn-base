//
//  TMXremoveBindPrinterView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXremoveBindPrinterView.h"
#import "TMXPopMenuFirstCell.h"
#import "TMXRemoveBindPrinterDescribeCell.h"
#import "TMXPrinterHeadView.h"
#import "TMXSelectRemovePrinterObjCell.h"
#import "TMXSelectUserView.h"

@interface TMXremoveBindPrinterView ()<UITableViewDelegate,UITableViewDataSource>{

    BOOL isOwerRemovePrinter;
    BOOL isremoveSelectUserView;
}

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) TMXSelectUserView *selectUserView;

@end

@implementation TMXremoveBindPrinterView

static NSString * const firstCellID = @"firstCellID";
static NSString * const describeCellID = @"describeCellID";
static NSString * const headViewID = @"headViewID";
static NSString * const selectRemovePrinterObjCellID = @"selectRemovePrinterObjCellID";

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

- (TMXSelectUserView *)selectUserView{
    
    if (!_selectUserView) {
        _selectUserView = [[TMXSelectUserView alloc] initWithFrame:CGRectZero];
        _selectUserView.removeSelectUserViewblock = ^(){
            isremoveSelectUserView = YES;
            [_selectUserView removeFromSuperview];
        };
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
    }
    return _selectUserView;
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    [self updateConstraints];
}

- (void)initUI{

    [self.tableView registerClass:[TMXPopMenuFirstCell class] forCellReuseIdentifier:firstCellID];
    [self.tableView registerClass:[TMXRemoveBindPrinterDescribeCell class] forCellReuseIdentifier:describeCellID];
    [self.tableView registerClass:[TMXPrinterHeadView class] forHeaderFooterViewReuseIdentifier:headViewID];
    [self.tableView registerClass:[TMXSelectRemovePrinterObjCell class] forCellReuseIdentifier:selectRemovePrinterObjCellID];
    [self addSubview:self.tableView];
    [self initFooterView];
    [self updateConstraints];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(owerBtnselected:) name:@"OwerBtnSelected" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(managerBtnSelected:) name:@"ManagerBtnSelected" object:nil];
}

#pragma mark <initFooterView>
- (void)initFooterView{
    
    //尾视图
    UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 512 , 100)];
    UIButton *signOut= [UIButton buttonWithType:(UIButtonTypeSystem)];
    signOut.frame = CGRectMake(106, 50, 300, 40);
    signOut.layer.cornerRadius=5.0;
    signOut.layer.masksToBounds=YES;
    signOut.backgroundColor=systemColor;
    [signOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signOut setTitle:@"解除绑定" forState:UIControlStateNormal];
    [signOut addTarget:self action:@selector(cancelBind) forControlEvents:UIControlEventTouchUpInside];
    signOut.titleLabel.font=[UIFont systemFontOfSize:16];
    [footer addSubview:signOut];
    
    self.tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 512, 100)];
    self.tableView.tableFooterView=footer;
    self.tableView.tableFooterView.backgroundColor = RGBColor(228, 233, 234);
}

#pragma mark <notification>
- (void)owerBtnselected:(NSNotification *)notif{

    [self.tableView reloadData];
}

- (void)managerBtnSelected:(NSNotification *)notif{

    [self.tableView reloadData];
}

- (void)cancelBind{
    
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"notificationRemoveReleaseBindPrinterView" object:nil];
}

#pragma mark <table View delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }else if(section == 1){
    
        return 3;
    }else{
    
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        if (indexPath.row == 2) {
            return 100;
        }
    }else if (indexPath.section == 0){
    
        return 50;
    }
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0.01;
    }else if(section == 2){
     
        return 50;
    }else{
        return 15;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    TMXPrinterHeadView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headViewID];
    UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
    if (!headView) {
        headView = [[TMXPrinterHeadView alloc] initWithReuseIdentifier:headViewID];
    }
    if (section == 2) {
        headView.headLabel.text = @"共有2为用户共享，请选择用户并转让管理权";
        if (isOwerRemovePrinter) {
            return view;
        }
        return headView;
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TMXPopMenuFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:firstCellID];
    TMXRemoveBindPrinterDescribeCell * describeCell = [tableView dequeueReusableCellWithIdentifier:describeCellID];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    TMXSelectRemovePrinterObjCell * selectObjCell = [tableView dequeueReusableCellWithIdentifier:selectRemovePrinterObjCellID];
    if (!firstCell) {
        firstCell = [[TMXPopMenuFirstCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:firstCellID];
    }
    if (!describeCell) {
        describeCell = [[TMXRemoveBindPrinterDescribeCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:describeCellID];
    }
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    if (!selectObjCell) {
        selectObjCell = [[TMXSelectRemovePrinterObjCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:selectRemovePrinterObjCellID];
    }
    
    selectObjCell.managerRemoveblock = ^(){
        //管理者解除
        isOwerRemovePrinter = NO;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ManagerBtnSelected" object:nil];
    };
    selectObjCell.owerRemoveblock = ^(){
        //所有者解除
        isOwerRemovePrinter = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"OwerBtnSelected" object:nil];
    };
    
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [firstCell.cancelBtn setImage:[UIImage imageNamed:@"CancelIcon"] forState:(UIControlStateNormal)];
    describeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    selectObjCell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    firstCell.cancelblock = ^(){
    
        [[NSNotificationCenter defaultCenter]postNotificationName:@"notificationRemoveReleaseBindPrinterView" object:nil];
    };
    if (indexPath.section == 0) {
        return firstCell;
    }else if (indexPath.section == 1){
    
        if (indexPath.row == 2) {
            
            if (isOwerRemovePrinter) {
                selectObjCell.isSelectOwerBtn = YES;
            }
            return selectObjCell;
        }else{
        
            if (indexPath.row == 0) {
                describeCell.leftLabel.text = @"名       称:";
                describeCell.rightLabel.text = @"yeehaw_2456打印机";
            }else{
            
                describeCell.leftLabel.text = @"添加时间:";
                describeCell.rightLabel.text = @"2016-08-05";
            }
            return describeCell;
        }
    }else{
    
        cell.textLabel.text = @"选择共享用户";
        cell.textLabel.textColor = RGBColor(53, 53, 53);
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        if (isOwerRemovePrinter) {
            cell.hidden = YES;
        }
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 2) {
        isremoveSelectUserView = NO;
        [self addSubview:self.selectUserView];
        [_selectUserView useAnimation];
    }
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.equalTo(@512);
        make.top.equalTo(weakSelf.mas_top).with.offset(100);
    }];
    if (!isremoveSelectUserView) {
        [_selectUserView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
