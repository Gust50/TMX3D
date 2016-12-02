//
//  TMXSharePrinterView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/31.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSharePrinterView.h"
#import "TMXPopMenuFirstCell.h"
#import "TMXSharePrinterCell.h"
#import "TMXCreateQRcodeView.h"

@interface TMXSharePrinterView ()<UITableViewDelegate,UITableViewDataSource>{

    CGFloat tabHeight;
    BOOL isRemoveQRcodeView;
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) TMXCreateQRcodeView *QRcodeView;

@end

@implementation TMXSharePrinterView
static NSString *const firstCellID = @"firstCellid";
static NSString *const SharePrinterCellID = @"sharePrinterCellID";
#pragma mark <lazyload>
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
        _tableView.backgroundColor = RGBColor(237, 237, 237);
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
    }
    return _tableView;
}

- (TMXCreateQRcodeView *)QRcodeView{

    if (!_QRcodeView) {
        _QRcodeView = [[TMXCreateQRcodeView alloc] initWithFrame:CGRectZero];
        _QRcodeView.removeQRcodeViewblock = ^(){
        
            isRemoveQRcodeView = YES;
            [_QRcodeView removeFromSuperview];
        };
    }
    return _QRcodeView;
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

- (void) initUI{

    [self.tableView registerClass:[TMXPopMenuFirstCell class] forCellReuseIdentifier:firstCellID];
    [self.tableView registerClass:[TMXSharePrinterCell class] forCellReuseIdentifier:SharePrinterCellID];
    [self addSubview:self.tableView];
     [self initFooterView];
    [self updateConstraints];
}

#pragma mark <adjust tableView>
- (void)adjustTableView{
    if (Lanscape) {
        self.tableView.frame = CGRectMake(ScreenLW*APPScale/2-190, ScreenLH*APPScale, 380, 0);
    }else{
    
        self.tableView.frame = CGRectMake(ScreenPW*APPScale/2-190, ScreenPH*APPScale, 380,0);
    }
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (Lanscape) {
            self.tableView.frame = CGRectMake(ScreenLW*APPScale/2-190, ScreenLH/4, 380, ScreenLH*APPScale/2);
            LRLog(@"%f------%f",ScreenLW,APPScale);
        }else{
            self.tableView.frame = CGRectMake(ScreenPW*APPScale/2-190, ScreenPH/4, 380, ScreenPH*APPScale/2);
            NSLog(@"=====%f",APPScale);
        }
        [self addSubview:self.tableView];
    } completion:^(BOOL finished) {
        
    }];
    
    [self initFooterView];
}

#pragma mark <initFooterView>
- (void)initFooterView{
    
    //尾视图
    UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 380 , 100)];
    UIButton *signOut= [UIButton buttonWithType:(UIButtonTypeSystem)];
    signOut.frame = CGRectMake(40, 30, 300, 40);
    signOut.layer.cornerRadius=5.0;
    signOut.layer.masksToBounds=YES;
    signOut.backgroundColor=systemColor;
    [signOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signOut setTitle:@"生成二维码" forState:UIControlStateNormal];
    [signOut addTarget:self action:@selector(creatQRCode:) forControlEvents:UIControlEventTouchUpInside];
    signOut.titleLabel.font=[UIFont systemFontOfSize:16];
    [footer addSubview:signOut];
    
    self.tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 380, 100)];
    self.tableView.tableFooterView=footer;
    self.tableView.tableFooterView.backgroundColor = RGBColor(237, 237, 237);
    
}

- (void)creatQRCode:(UIButton *)btn{
    //生成二维码
    NSLog(@".....");
    isRemoveQRcodeView = NO;
    [self addSubview:self.QRcodeView];
    [_QRcodeView useAnimation];
    [self updateConstraints];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"notificationRemoveSharePtinterView" object:nil];
}

#pragma mark <table delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 50;
    }
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0.01;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXPopMenuFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:firstCellID];
    TMXSharePrinterCell * sharePrinterCell = [tableView dequeueReusableCellWithIdentifier:SharePrinterCellID];
    if (!firstCell) {
        firstCell = [[TMXPopMenuFirstCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:firstCellID];
    }
    if (!sharePrinterCell) {
        sharePrinterCell = [[TMXSharePrinterCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SharePrinterCellID];
    }
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [firstCell.cancelBtn setImage:[UIImage imageNamed:@"CancelIcon"] forState:(UIControlStateNormal)];
    
    sharePrinterCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        
        firstCell.cancelblock = ^(){
        
            [[NSNotificationCenter defaultCenter]postNotificationName:@"notificationRemoveSharePtinterView" object:nil];
        };
        
        return firstCell;
    }else if (indexPath.section == 1){
    
        if (indexPath.row == 0) {
            sharePrinterCell.describeLabel.text = @"共享人数:";
            sharePrinterCell.lastLabel.text = @"人";
            sharePrinterCell.attentionLabel.text = @"打印机共享人数总数不能超过20人";
        }else{
        
            sharePrinterCell.describeLabel.text = @"有效时间:";
            sharePrinterCell.lastLabel.text = @"分钟";
            sharePrinterCell.attentionLabel.text = @"二维码有效时长不能超过120分钟，请尽快截图分享";
        }
        return sharePrinterCell;
        
    }
    return nil;
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.equalTo(@380);
        make.height.equalTo(@450);
    }];
    if (!isRemoveQRcodeView) {
        [_QRcodeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    
}
@end
