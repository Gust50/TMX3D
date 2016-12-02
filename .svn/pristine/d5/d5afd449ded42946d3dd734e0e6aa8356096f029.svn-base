//
//  TMXUnBindPrinterSelectionView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/10/28.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXUnBindPrinterSelectionView.h"
#import "TMXPopMenuFirstCell.h"
#import "TMXBindPrinterSwitchCell.h"
@interface TMXUnBindPrinterSelectionView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

@end
@implementation TMXUnBindPrinterSelectionView

static NSString *const firstViewCellID = @"FirstViewCellID";
static NSString *const commomCellID = @"UncommomCellID";
static NSString *const UnswitchCellID = @"UnSwitchCellID";

#pragma mark <lazyLoad>
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

#pragma mark <initUI>
- (void)initUI{
    [self.tableView registerClass:[TMXPopMenuFirstCell class] forCellReuseIdentifier:firstViewCellID];
    [self.tableView registerClass:[TMXBindPrinterSwitchCell class] forCellReuseIdentifier:UnswitchCellID];
    [self adjustTableView];
}
#pragma mark <调整tableView>
- (void)adjustTableView{

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
    } completion:^(BOOL finished) {
        
    }];
    
    [self initFooterView];
}


-(void)useAnimation{
    [self adjustTableView];
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
    [signOut addTarget:self action:@selector(cancelBind) forControlEvents:UIControlEventTouchUpInside];
    signOut.titleLabel.font=[UIFont systemFontOfSize:16];
    [footer addSubview:signOut];
    
    self.tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.tableView.tableFooterView=footer;
    self.tableView.tableFooterView.backgroundColor = RGBColor(228, 233, 234);
    
}

- (void)cancelBind{

    if (self.delegate && [self.delegate respondsToSelector:@selector(removeSharePrinter)]) {
        [self.delegate removeSharePrinter];
    }
    [self removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0.01;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TMXPopMenuFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:firstViewCellID];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:commomCellID];
    TMXBindPrinterSwitchCell * switchCell = [tableView dequeueReusableCellWithIdentifier:UnswitchCellID];
    if (!firstCell) {
        firstCell = [[TMXPopMenuFirstCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:firstViewCellID];
    }
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:commomCellID];
    }
    if (!switchCell) {
        switchCell  = [[TMXBindPrinterSwitchCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:UnswitchCellID];
    }
    switchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = RGBColor(53, 53, 53);
    cell.detailTextLabel.textColor = RGBColor(102, 102, 102);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        
        firstCell.cancelblock = ^(){
        
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationRemoveUnbindPrinterView" object:nil];
        };
        return firstCell;
    }else{
        if (indexPath.row == 1) {
            switchCell.describeLabel.text = @"设为默认打印机";
            return switchCell;
        }else{
        
            if (indexPath.row == 0) {
                cell.textLabel.text = @"任务列表";
            }else if (indexPath.row == 2){
                
                cell.textLabel.text = @"备注名称";
                cell.detailTextLabel.text = @"神州100号";
            }
            
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(goUnBindPrintertaskList)]) {
                [self.delegate goUnBindPrintertaskList];
            }
        }else if (indexPath.row == 2){
        
            if (self.delegate && [self.delegate respondsToSelector:@selector(motifyUnBindPtinterName)]) {
                [self.delegate motifyUnBindPtinterName];
            }
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationRemoveUnbindPrinterView" object:nil];
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
