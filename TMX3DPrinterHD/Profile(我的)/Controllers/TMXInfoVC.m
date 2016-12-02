//
//  TMXInfoVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/11.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXInfoVC.h"
#import "TMXInfoPhotoCell.h"
#import "TMXSetupCell.h"
#import "TMXLogoutFooterView.h"
#import "TMXEditNickNameVC.h"
#import "TMXAccountModel.h"
#import "TMXAccountProfileInfo.h"

@interface TMXInfoVC ()<UITableViewDelegate,UITableViewDataSource,TMXInfoPhotoCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    TMXAccountLoginModel *tMXAccountLoginModel;   ///<退出登录
    TMXAccountProfileInfo *accountProfileInfo;    ///<获取个人信息数据模型
    TMXAccountUploadImageModel * uploadImageModel;///<上传图片模型
    UIImagePickerController *_imagePicker;
    UIImage * iconImage;                          ///<头像
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TMXInfoVC
static NSString *const infoPhotoCellID=@"infoPhotoCellID";
static NSString *const setupCellID=@"TMXSetupCell";

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人设置"];
    self.view.backgroundColor=backGroundColor;
    [self.view addSubview:self.tableView];
    [self loadFooter];
    [_tableView registerClass:[TMXInfoPhotoCell class] forCellReuseIdentifier:infoPhotoCellID];
    [_tableView registerClass:[TMXSetupCell class] forCellReuseIdentifier:setupCellID];
    [self loadData];
    
    [self configureRightBarButtonWithTitle:nil icon:@"CancelIcon" action:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeInfoController" object:nil];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"updateName" object:nil];
}

- (void)refreshData
{
    [self loadData];
}

#pragma mark <loadData>
- (void)loadData
{
    accountProfileInfo = [[TMXAccountProfileInfo alloc] init];
    uploadImageModel = [[TMXAccountUploadImageModel alloc] init];
    [accountProfileInfo FetchTMXAccountProfileInfoData:nil callBack:^(BOOL isSuccess, id  _Nonnull result) {
        if (isSuccess) {
            accountProfileInfo = result;
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:accountProfileInfo.avatar]];
            iconImage = [UIImage imageWithData:data];
            [self.tableView reloadData];
        }else
        {
            [MBProgressHUD showError:result];
        }
    }];
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

//退出登录
- (void)exitLogin
{
    tMXAccountLoginModel=[[TMXAccountLoginModel alloc]init];
    [tMXAccountLoginModel FetchTMXAccountLogoutData:nil callBack:^(BOOL isSuccess, id  _Nonnull result) {
        
        if (isSuccess) {
            
            [MBProgressHUD showSuccess:result];
            dispatch_after((dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1*NSEC_PER_SEC))), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"removeInfoController" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"exitLoginSuc" object:nil];
            });
        }else{
            
            [MBProgressHUD showError:result];
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1)
    {
        return 4;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TMXInfoPhotoCell *photoCell=[tableView dequeueReusableCellWithIdentifier:infoPhotoCellID forIndexPath:indexPath];
        photoCell.icon.image = iconImage;
        photoCell.delegate = self;
        photoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return photoCell;
    }else if (indexPath.section == 1)
    {
        TMXSetupCell *setupCell = [tableView dequeueReusableCellWithIdentifier:setupCellID forIndexPath:indexPath];
        setupCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            setupCell.leftStr = @"昵称";
            if (accountProfileInfo.nickName.length == 0) {
                setupCell.rightStr = @"请输入昵称";
            }else
            {
                setupCell.rightStr = accountProfileInfo.nickName;
            }
            setupCell.isArrow = NO;
        }else if (indexPath.row == 1) {
            setupCell.leftStr = @"性别";
            setupCell.rightStr = @"保密";
            setupCell.isArrow = NO;
        }else if (indexPath.row == 2) {
            setupCell.leftStr = @"出生日期";
            setupCell.rightStr = accountProfileInfo.birthDay;
            setupCell.isArrow = NO;
        }else if (indexPath.row == 3) {
            setupCell.leftStr = @"我的签名";
            if (accountProfileInfo.signature.length == 0) {
                setupCell.rightStr = @"请输入签名";
            }else
            {
                setupCell.rightStr = accountProfileInfo.signature;
            }
            setupCell.isArrow = NO;
        }
        return setupCell;
    }else
    {
        TMXSetupCell *setupCell = [tableView dequeueReusableCellWithIdentifier:setupCellID forIndexPath:indexPath];
        setupCell.selectionStyle = UITableViewCellSelectionStyleNone;
        setupCell.leftStr = @"我的手机号";
        setupCell.isArrow = YES;
        if (accountProfileInfo.mobile.length == 0) {
            setupCell.rightStr = @"还没有绑定手机号";
        }else
        {
            setupCell.rightStr = accountProfileInfo.mobile;
        }
        
        return setupCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            TMXEditNickNameVC *nickNameVC = [TMXEditNickNameVC new];
            nickNameVC.titleStr = @"编辑昵称";
            nickNameVC.placeHolder = @"请输入昵称";
            nickNameVC.describeStr = @"*用户名可有中文、英文、特殊字符组成，最多不超过10个字。";
            nickNameVC.nickName = accountProfileInfo.nickName;
            [self.navigationController pushViewController:nickNameVC animated:YES];
        }else if (indexPath.row == 1)
        {
            
        }else if (indexPath.row == 2)
        {
            
        }else
        {
            TMXEditNickNameVC *nickNameVC = [TMXEditNickNameVC new];
            nickNameVC.titleStr = @"我的签名";
            nickNameVC.placeHolder = @"请输入签名";
            nickNameVC.describeStr = @"*我的签名最多不超过20个数。";
            nickNameVC.nickName = accountProfileInfo.signature;
            [self.navigationController pushViewController:nickNameVC animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else
    {
        return 40;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

#pragma mark <TMXInfoPhotoCellDelegate>
-(void)clickCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:^{
        
    }];//进入照相界面
}

-(void)clickPhoto
{
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//数据来源，摄像头
    _imagePicker.allowsEditing = YES; //允许编辑
    _imagePicker.delegate = self; //设置代理，检测操作
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

#pragma marl UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    TMXInfoPhotoCell * cell = [[TMXInfoPhotoCell alloc] init];
    iconImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    cell.icon.image = iconImage;
    
    NSString * mediatype = [info objectForKey:UIImagePickerControllerMediaType];
//    if ([mediatype isEqualToString:(NSString *)kUTTypeImage]) {//如果是拍照
//        UIImage * orignalImage = nil;
//        UIImage * cropImage = nil;
//        if (_imagePicker.allowsEditing) {
//            
//            cropImage = [info objectForKey:UIImagePickerControllerEditedImage];//获取编辑后的照片
//            UIImageWriteToSavedPhotosAlbum(cropImage, nil, nil, nil);//保存到相册
//            iconImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
//            cell.icon.image = iconImage;
//            
//        }else{
//            
//            orignalImage = [info objectForKey:UIImagePickerControllerOriginalImage];//获取原始照片
//            UIImageWriteToSavedPhotosAlbum(orignalImage, nil, nil, nil);//保存到相册
//            iconImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//            cell.icon.image = iconImage;
//        }
//    }
    
    NSData * originImageDate = UIImageJPEGRepresentation(iconImage,0.5f);
    NSString * imgStr = [originImageDate base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"fileName"] = @"avatar.png";
    params[@"base64Data"] = imgStr;
    //执行长传头像的代码
    
    [uploadImageModel FetchTMXAccountIconData:params callBack:^(BOOL isSuccess, id  _Nonnull result) {
        if (isSuccess) {
            uploadImageModel = result;
            
            NSLog(@"----------------%@",uploadImageModel.url);
            [MBProgressHUD showSuccess:NSLocalizedString(@"Upload_Suc", nil)];
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:uploadImageModel.url]];
            iconImage = [UIImage imageWithData:data];
            //[self.tableView reloadData];
            [self updateData];
            
        }else{
            
            [MBProgressHUD showError:result];
        }
        
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
    
}

#pragma mark 更新数据
- (void)updateData{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"avatar"] = uploadImageModel.src;
    [accountProfileInfo FetchTMXAccountUpdateProfileInfoData:params callBack:^(BOOL isSuccess, id  _Nonnull result) {
        if (isSuccess) {
            //            [MBProgressHUD showSuccess:result];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateName" object:nil userInfo:nil];
            [self loadData];
        }else{
            
            [MBProgressHUD showError:result];
        }
    }];
}

@end
