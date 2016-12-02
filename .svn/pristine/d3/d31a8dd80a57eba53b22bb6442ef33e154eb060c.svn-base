//
//  TMXSelectUserView.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/8.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXSelectUserView.h"
#import "TMXSelectUserHeadCell.h"
#import "TMXSelectUserCell.h"

@interface TMXSelectUserView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end
@implementation TMXSelectUserView

static NSString *const headViewCellID = @"headViewCellID";
static NSString *const contentCellID = @"contentCellID";
#pragma mark <lazyLoad>
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
        _tableView.backgroundColor = RGBColor(228, 233, 234);
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 5;
    }
    return _tableView;
}
- (instancetype)initWithFrame:(CGRect)frame{

    if (self == [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    [self constraintsTableView];
}

- (void)constraintsTableView{

    self.tableView.frame = CGRectMake(self.center.x-256, 100, 512, self.frame.size.height-200);
}

- (void)initUI{
    
    [self.tableView registerClass:[TMXSelectUserHeadCell class] forCellReuseIdentifier:headViewCellID];
    [self.tableView registerClass:[TMXSelectUserCell class] forCellReuseIdentifier:contentCellID];
    [self adjustTableView];
    
}

- (void)adjustTableView{

    self.tableView.frame = CGRectMake(self.center.x+256, 100, 0, self.frame.size.height-200);
    [UIView animateWithDuration:0.5 delay:0.0 options:(UIViewAnimationOptionTransitionFlipFromRight) animations:^{
        self.tableView.frame = CGRectMake(self.center.x-256, 100, 512, self.frame.size.height-200);
        [self addSubview:self.tableView];
        
    } completion:^(BOOL finished) {
    
    }];
}

- (void)useAnimation{

    [self adjustTableView];
}

#pragma mark <tableView delegate datasource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 50;
    }
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TMXSelectUserHeadCell * headViewCell = [tableView dequeueReusableCellWithIdentifier:headViewCellID];
    TMXSelectUserCell * contentCell = [tableView dequeueReusableCellWithIdentifier:contentCellID];
    if (!headViewCell) {
        headViewCell = [[TMXSelectUserHeadCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:headViewCellID];
    }
    if (!contentCell) {
        contentCell = [[TMXSelectUserCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:contentCellID];
    }
    headViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        return headViewCell;
    }else{
    
        return contentCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"hahahahahahahahsb");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (self.removeSelectUserViewblock) {
        self.removeSelectUserViewblock();
    }
}

- (void)updateConstraints{

    [super updateConstraints];
    WS(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.equalTo(@512);
        make.top.equalTo(weakSelf.mas_top).with.offset(100);
    }];
}

@end
