//
//  TMXBindPrinterSelectionView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/27.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBindPrinterSelectionView.h"
#import "TMXPopMenuFirstCell.h"
#import "TMXBindPrinterSwitchCell.h"
#import "TMXMotifyPrinterNameView.h"

@interface TMXBindPrinterSelectionView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) TMXMotifyPrinterNameView * motifyPrinterNameView;

@end
@implementation TMXBindPrinterSelectionView

static NSString *const firstCellID = @"firstCellID";
static NSString *const commomCellID = @"commomCellID";
static NSString *const switchCellID = @"switchCellID";

#pragma mark <lazyload>
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
    }
    return _tableView;
}

#pragma mark <init>
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
//    [self adjustTabelView];
}

#pragma mark <initUI>
- (void)initUI{

    [self.tableView registerClass:[TMXPopMenuFirstCell class] forCellReuseIdentifier:firstCellID];
    [self.tableView registerClass:[TMXBindPrinterSwitchCell class] forCellReuseIdentifier:switchCellID];
    [self adjustTabelView];
//    [self addSubview:self.tableView];
//    [self initFooterView];
//    [self updateConstraints];
}


#pragma mark <adjust tableView>
- (void)adjustTabelView{

    if (Lanscape) {
        self.tableView.frame = CGRectMake(ScreenLW*APPScale-340, ScreenLH*APPScale, 320, ScreenLH*APPScale-40);
    }else{
        
        self.tableView.frame = CGRectMake(ScreenPW*APPScale-340, ScreenPH*APPScale, 320, ScreenPH*APPScale-40);
    }
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.8 initialSpringVelocity:5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        if (Lanscape) {
            _tableView.frame = CGRectMake(ScreenLW*APPScale-340, 20, 320, ScreenLH*APPScale-40);
        }else{
            
            _tableView.frame = CGRectMake(ScreenPW*APPScale-340, 20, 320, ScreenPH*APPScale-40);
        }
        [self addSubview:self.tableView];
        [self updateConstraints];
    } completion:^(BOOL finished) {
        
    }];
    
    [self initFooterView];
}

#pragma mark <initFooterView>
- (void)initFooterView{

    //尾视图
    UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320 , 100)];
    UIButton *signOut= [UIButton buttonWithType:(UIButtonTypeSystem)];
    signOut.frame = CGRectMake(10, 30, 300, 40);
    signOut.layer.cornerRadius=5.0;
    signOut.layer.masksToBounds=YES;
    signOut.backgroundColor=systemColor;
    [signOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signOut setTitle:@"解除绑定" forState:UIControlStateNormal];
    [signOut addTarget:self action:@selector(removebind) forControlEvents:UIControlEventTouchUpInside];
    signOut.titleLabel.font=[UIFont systemFontOfSize:16];
    [footer addSubview:signOut];
    
    self.tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.tableView.tableFooterView=footer;
    self.tableView.tableFooterView.backgroundColor = RGBColor(228, 233, 234);
    
}

- (void)removebind{

    if (self.delegate && [self.delegate respondsToSelector:@selector(removeBindPrinter)]) {
        [self.delegate removeBindPrinter];
    }
    [self removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }else if (section == 3){
    
        return 2;
    }else if (section == 2){
    
        return 3;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section != 0) {
        return 20;
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXPopMenuFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:firstCellID];
    UITableViewCell * commomCell = [tableView dequeueReusableCellWithIdentifier:commomCellID];
    TMXBindPrinterSwitchCell *switchCell = [tableView dequeueReusableCellWithIdentifier:switchCellID];
    if (!firstCell) {
        firstCell = [[TMXPopMenuFirstCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:firstCellID];
    }
    if (!commomCell) {
        commomCell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:commomCellID];
    }
    if (!switchCell) {
        switchCell = [[TMXBindPrinterSwitchCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:switchCellID];
    }
    
    commomCell.textLabel.font = [UIFont systemFontOfSize:14];
    commomCell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    commomCell.textLabel.textColor = RGBColor(53, 53, 53);
    commomCell.detailTextLabel.textColor = RGBColor(102, 102, 102);
    commomCell.selectionStyle = UITableViewCellSelectionStyleNone;
    commomCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        firstCell.cancelblock = ^(){
        
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationRemoveBindPrinterView" object:nil];
        };
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return firstCell;
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                commomCell.textLabel.text = @"打印机中心";
                break;
            case 1:
                commomCell.textLabel.text = @"分享打印机";
                break;
            case 2:
                commomCell.textLabel.text = @"共享用户列表";
                commomCell.detailTextLabel.text = @"8位用户";
                break;
            case 3:
                commomCell.textLabel.text = @"任务列表";
                break;
            default:
                break;
        }
        
        return commomCell;
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                switchCell.describeLabel.text = @"设为默认打印机";
                switchCell.Switchblock = ^(BOOL isOn){
                    NSLog(@"-------ison:%zi",isOn);
                };
                break;
            case 1:
                switchCell.describeLabel.text = @"情感灯光节能";
                switchCell.Switchblock = ^(BOOL isOn){
                    NSLog(@"-------ison:%zi",isOn);
                };
                break;
            case 2:
                switchCell.describeLabel.text = @"安全门自动感应";
                switchCell.Switchblock = ^(BOOL isOn){
                    NSLog(@"-------ison:%zi",isOn);
                };
                break;
            default:
                break;
        }
        return switchCell;
    }
    if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                commomCell.textLabel.text = @"备注名称";
                commomCell.detailTextLabel.text = @"神州1000号";
                break;
            case 1:
                commomCell.textLabel.text = @"重设打印机wifi";
                
            default:
                break;
        }
        return commomCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"点击了第%zi个section，第%zi个row",indexPath.section,indexPath.row);
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                //打印机中心
                NSLog(@"......");
                if (self.delegate && [self.delegate respondsToSelector:@selector(goPrinterCenter)]) {
                    [self.delegate goPrinterCenter];
                }
                break;
            case 1:
                //分享打印机
                if (self.delegate && [self.delegate respondsToSelector:@selector(sharePrinter)]) {
                    [self.delegate sharePrinter];
                }
                break;
            case 2:
                //共享用户列表
                if (self.delegate && [self.delegate respondsToSelector:@selector(shareUserList)]) {
                    [self.delegate shareUserList];
                }
                break;
            case 3:
                //任务列表
                if (self.delegate && [self.delegate respondsToSelector:@selector(goTaskList)]) {
                    [self.delegate goTaskList];
                }
                break;
            default:
                break;
        }
    }else if (indexPath.section == 3){
    
        switch (indexPath.row) {
            case 0:
                //备注名称
                NSLog(@"......");
                if (self.delegate && [self.delegate respondsToSelector:@selector(goMotifyName)]) {
                    [self.delegate goMotifyName];
                    NSLog(@"------");
                }
                break;
            case 1:
                //重设打印机WIFI
                if (self.delegate && [self.delegate respondsToSelector:@selector(resetPrinterWifi)]) {
                    [self.delegate resetPrinterWifi];
                }
                break;
            default:
                break;
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

     [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationRemoveBindPrinterView" object:nil];
}


-(void)setIsUpdateAnimation:(BOOL)isUpdateAnimation{
    if (isUpdateAnimation) {
//        [self initUI];
        [self adjustTabelView];
    }
}

-(void)useAnimation{
    [self adjustTabelView];
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.mas_right).with.offset(-20);
            make.top.equalTo(weakSelf.mas_top).with.offset(20);
            make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-20);
            make.width.mas_equalTo(@320);
    }];
}
@end
