//
//  TMXFeedBackVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXFeedBackVC.h"
#import "TMXLogoutFooterView.h"
#import "TMXFeedbackTitleCell.h"
#import "TMXFeedbackSuggestCell.h"
#import "TMXAccountModel.h"

@interface TMXFeedBackVC ()<UITableViewDelegate, UITableViewDataSource, TMXFeedbackTitleCellDelegate, TMXFeedbackSuggestCellDelegate>
{
    TMXAccountLoginModel *tMXAccountLoginModel;
    NSString *titleStr;
    NSString *linkPhone;
    NSString *suggestStr;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TMXFeedBackVC
static NSString *const titleID = @"TMXFeedbackTitleCell";
static NSString *const suggestID = @"TMXFeedbackSuggestCell";

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = backGroundColor;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.navigationItem setTitle:@"意见反馈"];
    self.view.backgroundColor = backGroundColor;
    [self.view addSubview:self.tableView];
    tMXAccountLoginModel = [TMXAccountLoginModel new];
    [self loadFooter];
    [self.tableView registerClass:[TMXFeedbackTitleCell class] forCellReuseIdentifier:titleID];
    [self.tableView registerClass:[TMXFeedbackSuggestCell class] forCellReuseIdentifier:suggestID];
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];
}

- (void)loadFooter
{
    TMXLogoutFooterView *footerView = [[TMXLogoutFooterView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    footerView.name = @"提交";
    footerView.footerViewBlock = ^(){
        [self loadData];
    };
    self.tableView.tableFooterView = footerView;
}

- (void)loadData
{
    if ([self isValidateSuccess])
    {
        NSMutableDictionary *params=[NSMutableDictionary dictionary];
        params[@"contact"]=linkPhone;
        params[@"content"]=suggestStr;
        
        [tMXAccountLoginModel FetchTMXAccountFeedBackData:params callBack:^(BOOL isSuccess, id  _Nonnull result) {
            
            if (isSuccess) {
                [[MBProgressHUD showMessage:result]hide:YES afterDelay:0.5];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [MBProgressHUD showError:result];
            }
        }];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TMXFeedbackTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:titleID forIndexPath:indexPath];
        titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
        titleCell.delegate = self;
        if (indexPath.row == 0) {
            titleCell.titleStr = @"标       题:";
            titleCell.placehold = @"请输入标题";
        }else
        {
            titleCell.titleStr = @"联系电话:";
            titleCell.placehold = @"请输入电话号码";
        }
        return titleCell;
    }else
    {
        TMXFeedbackSuggestCell *suggestCell = [tableView dequeueReusableCellWithIdentifier:suggestID forIndexPath:indexPath];
        suggestCell.selectionStyle = UITableViewCellSelectionStyleNone;
        suggestCell.delegate = self;
        return suggestCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 40;
    }else
    {
        return 300;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(BOOL)isValidateSuccess{
    
    if (![KBRegexp checkPhoneNumInput:linkPhone]) {
        
        [MBProgressHUD showError:@"手机号格式不对"];
        return NO;
        
    }else if(suggestStr.length==0 && suggestStr==nil)
    {
        [MBProgressHUD showError:@"请输入反馈内容"];
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - TMXFeedbackTitleCellDelegate
-(void)clickLeftStr:(NSString *)leftStr rightStr:(NSString *)rightStr
{
    if ([leftStr isEqualToString:@"标       题:"]) {
        titleStr = rightStr;
    }else
    {
        linkPhone = rightStr;
    }
}

#pragma mark - TMXFeedbackSuggestCellDelegate
-(void)clickSuggest:(NSString *)suggest
{
    suggestStr = suggest;
}

@end
