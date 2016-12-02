//
//  TMXPrinterControlVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterControlVC.h"
#import "KBSegmentView.h"
#import "TMXPrinterStatusCell.h"
#import "TMXPrinterHistoryCell.h"
#import "TMXPrinterStatusHeader.h"
#import "TMXPrinterControlView.h"
#import "TMXBgFixPrinterVC.h"
#import "AppDelegate.h"

@interface TMXPrinterControlVC ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, KBSegmentViewDelegate,TMXPrinterStatusCellDelegate, TMXPrinterHistoryCellDelegate, TMXPrinterControlViewDelegate,TMXBgFixPrinterVCDelegate>
{
    NSInteger segmentTag;
}
@property (nonatomic, strong) KBSegmentView *segment;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TMXPrinterControlView *printerControlView;
@property (nonatomic, strong) TMXBgFixPrinterVC *bgFixPrinterVC;
@end

@implementation TMXPrinterControlVC
static NSString *const printerStatusID = @"TMXPrinterStatusCell";
static NSString *const printerHistoryCellID = @"TMXPrinterHistoryCell";
static NSString *const headerID = @"TMXPrinterStatusHeader";

-(KBSegmentView *)segment{
    if (!_segment) {
        _segment=[KBSegmentView createSegmentFrame:CGRectZero
                                   segmentTitleArr:@[@"打印中心",@"控制中心"]
                                   backgroundColor:[UIColor whiteColor]
                                        titleColor:[UIColor blackColor]
                                  selectTitleColor:systemColor
                                         titleFont:[UIFont systemFontOfSize:16]bottomLineColor:systemColor
                                     isVerticleBar:NO delegate:self];
    }
    return _segment;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView=[UIScrollView new];
        _scrollView.backgroundColor=backGroundColor;
    }
    return _scrollView;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = backGroundColor;
    }
    return _tableView;
}

-(TMXPrinterControlView *)printerControlView
{
    if (!_printerControlView) {
        _printerControlView = [TMXPrinterControlView new];
        _printerControlView.delegate = self;
    }
    return _printerControlView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=backGroundColor;
    [self.view addSubview:self.segment];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.tableView];
    //register
    [_tableView registerClass:[TMXPrinterStatusCell class] forCellReuseIdentifier:printerStatusID];
    [_tableView registerClass:[TMXPrinterHistoryCell class] forCellReuseIdentifier:printerHistoryCellID];
    [_tableView registerClass:[TMXPrinterStatusHeader class] forHeaderFooterViewReuseIdentifier:headerID];
    segmentTag = 0;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeBackgroundBtn) name:@"FixCompletion" object:nil];
    [self configureLeftBarButtonWithTitle:@"返回" icon:@"return_back" action:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"PopChangeFrame" object:nil userInfo:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_segment mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.top.mas_equalTo(@(74));
        make.height.mas_equalTo(@(60));
    }];
    
    [_scrollView  mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.top.equalTo(_segment.mas_bottom);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    if (segmentTag == 0) {
        [_tableView  mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.top.equalTo(_segment.mas_bottom).with.offset(10);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
    }else
    {
        [_printerControlView  mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.view.mas_left);
            make.right.equalTo(weakSelf.view.mas_right);
            make.top.equalTo(_segment.mas_bottom).with.offset(10);
            make.bottom.equalTo(weakSelf.view.mas_bottom);
        }];
    }
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    _segment.isUpdateUI=YES;
    [self.view setNeedsUpdateConstraints];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TMXPrinterStatusCell *printerStatusCell = [tableView dequeueReusableCellWithIdentifier:printerStatusID forIndexPath:indexPath];
        printerStatusCell.delegate = self;
        printerStatusCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return printerStatusCell;
    }else
    {
        TMXPrinterHistoryCell *printerHistoryCell = [tableView dequeueReusableCellWithIdentifier:printerHistoryCellID forIndexPath:indexPath];
        printerHistoryCell.delegate = self;
        printerHistoryCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return printerHistoryCell;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        TMXPrinterStatusHeader *headerView = [TMXPrinterStatusHeader new];
        headerView.TMXPrinterStatusHeaderBlock = ^(){
            NSLog(@"TMXPrinterStatusHeaderBlock");
        };
        return headerView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 180;
    }else
    {
        return 70;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else
    {
        return 40;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else
    {
        return 0;
    }
}

#pragma mark <KBSegmentViewDelegate>
-(void)selectSegment:(NSInteger)index
{
    segmentTag = index;
    if (index == 0) {
         [self.scrollView addSubview:self.tableView];
        [self.printerControlView removeFromSuperview];
    }else
    {
         [self.scrollView addSubview:self.printerControlView];
        [self.tableView removeFromSuperview];
    }
    [self updateViewConstraints];
}

#pragma mark <TMXPrinterStatusCellDelegate>
-(void)printerSwitchWire
{
    NSLog(@"printerSwitchWire");
}

-(void)printerPause
{
    NSLog(@"printerPause");
}

-(void)printerCancel
{
    NSLog(@"printerCancel");
}

#pragma mark <TMXPrinterHistoryCellDelegate>
-(void)printFile
{
    NSLog(@"printFile");
}

-(void)deleteFile
{
    NSLog(@"deleteFile");
}

#pragma mark <TMXPrinterControlViewDelegate>
-(void)topBtn:(NSInteger)btnTag
{
    NSLog(@"%ld", btnTag);
}

-(void)clickBtn:(NSInteger)btnTag
{
    NSLog(@"%ld", btnTag);
}

-(void)bottomBtn:(NSInteger)btnTag
{
    NSLog(@"%ld", btnTag);
    if (btnTag==1) {
        self.bgFixPrinterVC=[TMXBgFixPrinterVC new];
        _bgFixPrinterVC.delegate=self;
//        self.bgFixPrinterVC.isHidden = YES;
        self.bgFixPrinterVC.view.bounds=[UIScreen mainScreen].bounds;
        [ShareApp.window addSubview:_bgFixPrinterVC.view];
    }
}

-(void)removeBackgroundBtn{
    [_bgFixPrinterVC.view removeFromSuperview];
}


-(void)temChange:(UISlider *)slider
{
    NSLog(@"%f",slider.value);
}

@end
