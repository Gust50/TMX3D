//
//  TMXSelectWifiView.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/9.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectWifiView.h"

@interface TMXSelectWifiView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *dataDict;
@end

@implementation TMXSelectWifiView
static NSString *const cellID=@"cellID";

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

-(NSMutableDictionary *)dataDict{
    if (!_dataDict) {
        _dataDict=[NSMutableDictionary dictionary];
    }
    return _dataDict;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        [self initData];
    }
    return self;
}

-(void)initData{
    
    [self addSubview:self.tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [_dataDict removeAllObjects];
    [self.dataDict addEntriesFromDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"saveWifi"]];
    NSLog(@"%@",_dataDict);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    [_dataDict allKeys][indexPath.row]
    cell.textLabel.text= @"123434";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectWifiName:password:)]) {
        [self.delegate selectWifiName:[_dataDict allKeys][indexPath.row] password:[_dataDict allValues][indexPath.row]];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeSelectWifiView" object:nil];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [_tableView reloadData];
}

@end
