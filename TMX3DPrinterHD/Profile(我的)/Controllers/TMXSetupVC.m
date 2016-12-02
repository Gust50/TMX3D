//
//  TMXSetupVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSetupVC.h"
#import "TMXSetupCell.h"
#import "TMXLogoutFooterView.h"
#import "TMXFeedBackVC.h"
#import "TMXAboutVC.h"
#import "TMXRegisterVC.h"
#import "TMXAccountModel.h"
#import "TMXBgLoginVC.h"

@interface TMXSetupVC ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    NSString *cacheSize;
    TMXAccountLoginModel *tMXAccountLoginModel;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TMXSetupVC

static NSString *const setupCellID=@"setupCellID";

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
    
    [self.navigationItem setTitle:@"设置中心"];
    [self.view addSubview:self.tableView];
    tMXAccountLoginModel=[[TMXAccountLoginModel alloc]init];
    [self loadFooter];
    [_tableView registerClass:[TMXSetupCell class] forCellReuseIdentifier:setupCellID];
    
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
    }];

    float tmpSize = [[SDImageCache sharedImageCache] getSize] / 1024 /1024;
    NSString *clearCacheSizeStr = tmpSize >= 1 ? [NSString stringWithFormat:@"清除缓存(%.2fM)",tmpSize] : [NSString stringWithFormat:@"清除缓存(%.2fK)",tmpSize * 1024];
    cacheSize = clearCacheSizeStr;
}

- (void)loadFooter
{
    TMXLogoutFooterView *footerView = [[TMXLogoutFooterView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 150)];
    footerView.name = @"退出登录";
    footerView.footerViewBlock = ^(){
        [self exitLogin];
    };
    self.tableView.tableFooterView = footerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1)
    {
        return 3;
    }else
    {
        return 1;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TMXSetupCell *setupCell=[tableView dequeueReusableCellWithIdentifier:setupCellID forIndexPath:indexPath];
    setupCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            setupCell.leftStr = @"清除缓存";
            setupCell.isArrow = NO;
            setupCell.rightStr = cacheSize;
        }else if (indexPath.row == 1)
        {
            setupCell.leftStr = @"意见反馈";
            setupCell.isArrow = NO;
            setupCell.rightStr = @"";
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            setupCell.leftStr = @"关于yeehaw";
            setupCell.isArrow = NO;
            setupCell.rightStr = @"";
        }else if (indexPath.row == 1)
        {
            setupCell.leftStr = @"客服电话";
            setupCell.isArrow = YES;
            setupCell.rightStr = @"400-255-2567";
        }else
        {
            setupCell.leftStr = @"打分鼓励一下";
            setupCell.isArrow = NO;
            setupCell.rightStr = @"去AppStore打分";
        }
    }else
    {
        setupCell.leftStr = @"重置密码";
        setupCell.isArrow = NO;
        setupCell.rightStr = @"";
    }
    return setupCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            float tmpSize = [[SDImageCache sharedImageCache] getSize] / 1024 /1024;
            NSString *clearCacheSizeStr = tmpSize >= 1 ? [NSString stringWithFormat:@"清除缓存(%.2fM)",tmpSize] : [NSString stringWithFormat:@"清除缓存(%.2fK)",tmpSize * 1024];
            UIAlertView *showCache=[[UIAlertView alloc]initWithTitle:@"缓存大小" message:clearCacheSizeStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"清除", nil];
            [UIView appearance].tintColor = systemColor;
            [showCache show];
            
            [[SDImageCache sharedImageCache] clearDisk];
        }else
        {
            TMXFeedBackVC *feedBackVC = [TMXFeedBackVC new];
            [self.navigationController pushViewController:feedBackVC animated:YES];
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            TMXAboutVC *aboutVC = [TMXAboutVC new];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
    }else
    {
        TMXRegisterVC *registerVC = [TMXRegisterVC new];
        registerVC.isRegister = NO;
        [self.navigationController pushViewController:registerVC animated:YES];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0)
    {
        
    }else
    {
        [[SDImageCache sharedImageCache] clearDisk];
        float tmpSize = [[SDImageCache sharedImageCache] getSize] / 1024 /1024;
       NSString *clearCacheSizeStr = tmpSize >= 1 ? [NSString stringWithFormat:@"清除缓存(%.2fM)",tmpSize] : [NSString stringWithFormat:@"清除缓存(%.2fK)",tmpSize * 1024];
        cacheSize = clearCacheSizeStr;
        [self.tableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

//退出登录
- (void)exitLogin
{
    [tMXAccountLoginModel FetchTMXAccountLogoutData:nil callBack:^(BOOL isSuccess, id  _Nonnull result) {
        
        if (isSuccess) {
            
            [MBProgressHUD showSuccess:result];
            dispatch_after((dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1*NSEC_PER_SEC))), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"removeController" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"exitLoginSuc" object:nil];
            });
        }else{
            
            [MBProgressHUD showError:result];
        }
    }];
}

@end
