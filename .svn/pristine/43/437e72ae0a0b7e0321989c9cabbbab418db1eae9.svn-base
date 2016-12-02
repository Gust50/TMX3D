//
//  TMXDetailSelectPrintView.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/7.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXDetailSelectPrintView.h"
#import "TMXSelectPrintCell.h"
#import "TMXSelectPrintHeaderView.h"

@interface TMXDetailSelectPrintView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;

@end
@implementation TMXDetailSelectPrintView
static NSString *const cellID = @"TMXSelectPrintCell";
static NSString *const headerID = @"TMXSelectPrintHeaderView";

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

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.6];
        [self addSubview:self.tableView];
        
        [self.tableView registerClass:[TMXSelectPrintCell class] forCellReuseIdentifier:cellID];
        [self.tableView registerClass:[TMXSelectPrintHeaderView class] forHeaderFooterViewReuseIdentifier:headerID];
        [self updateConstraints];
        self.tableView.tableFooterView = [UIView new];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMXSelectPrintCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TMXSelectPrintHeaderView *headerView = [TMXSelectPrintHeaderView new];
    WS(weakSelf);
    headerView.removeHeaderBlock = ^(){
        [weakSelf removeFromSuperview];
    };
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMXSelectPrintCell *cell = (TMXSelectPrintCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
    [self removeFromSuperview];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMXSelectPrintCell * cell = (TMXSelectPrintCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

-(void)updateConstraints
{
    [super updateConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(150);
        make.left.equalTo(weakSelf.mas_left).with.offset(200);
        make.right.equalTo(weakSelf.mas_right).with.offset(-200);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-150);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

@end
