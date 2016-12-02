//
//  TMXEditNickNameVC.m
//  TMX3DPrinterHD
//
//  Created by wutaobo on 16/11/14.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXEditNickNameVC.h"
#import "TMXEditNickNameView.h"
#import "TMXAccountProfileInfo.h"

@interface TMXEditNickNameVC ()
{
    TMXAccountProfileInfo *profileInfoModel;    ///<修改个人信息数据模型
    NSMutableDictionary *params;                ///<传入参数
}
@property (nonatomic, strong) TMXEditNickNameView *nickNameView;
@property (nonatomic, copy) NSString *updateName;
@end

@implementation TMXEditNickNameVC

-(TMXEditNickNameView *)nickNameView
{
    if (!_nickNameView) {
        _nickNameView = [TMXEditNickNameView new];
        
    }
    return _nickNameView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:self.titleStr];
    self.view.backgroundColor = backGroundColor;
    [self.view addSubview:self.nickNameView];
    _nickNameView.describeStr = self.describeStr;
    _nickNameView.placeHolder = self.placeHolder;
    _nickNameView.nickName = self.nickName;
    profileInfoModel = [[TMXAccountProfileInfo alloc] init];
    params = [NSMutableDictionary dictionary];
    WS(weakSelf);
    self.nickNameView.TMXEditNickNameViewBlock = ^(NSString *update){
        weakSelf.updateName = update;
        [weakSelf loadData];
    };
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeInfoController" object:nil];
    }];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self updateViewConstraints];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    [_nickNameView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - loadData
- (void)loadData
{
    if ([self.titleStr isEqualToString:@"编辑昵称"]) {
        if ([KBRegexp validateUserName:self.updateName]) {
            params[@"nickName"] = self.updateName;
            [profileInfoModel FetchTMXAccountUpdateProfileInfoData:params callBack:^(BOOL isSuccess, id  _Nonnull result) {
                
                if (isSuccess) {
                    [MBProgressHUD showSuccess:@"修改成功"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateName" object:nil userInfo:nil];
                }else
                {
                    [MBProgressHUD showError:@"修改失败"];
                }
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else
        {
            [MBProgressHUD showError:@"请输入正确的昵称"];
        }
    }else
    {
        if ([KBRegexp validateUserName:self.updateName]) {
            profileInfoModel = [[TMXAccountProfileInfo alloc] init];
            params = [NSMutableDictionary dictionary];
            params[@"signature"] = self.updateName;
            [profileInfoModel FetchTMXAccountUpdateProfileInfoData:params callBack:^(BOOL isSuccess, id  _Nonnull result) {
                
                if (isSuccess) {
                    [MBProgressHUD showSuccess:@"修改成功"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateName" object:nil userInfo:nil];
                }else
                {
                    [MBProgressHUD showError:@"修改失败"];
                }
                
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else
        {
            [MBProgressHUD showError:@"请输入正确的签名"];
        }
    }
}

#pragma mark - setter getter
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
}

-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
}

-(void)setDescribeStr:(NSString *)describeStr
{
    _describeStr = describeStr;
}

-(void)setNickName:(NSString *)nickName
{
    _nickName = nickName;
}

@end
