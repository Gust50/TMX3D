//
//  TMXDesignVC.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXDesignVC.h"
#import "TMXDesignCell.h"
#import "TMXPrinterControlVC.h"

@interface TMXDesignVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *iconArr;
@property (nonatomic, strong) NSArray *mainSubArr;
@property (nonatomic, strong) NSArray *subArr;
@property (nonatomic, strong) NSArray *colorArr;
@end

@implementation TMXDesignVC
static NSString *const designCellID=@"designCellID";

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
    }
    return _tableView;
}


-(NSArray *)iconArr
{
    if (!_iconArr) {
        _iconArr=@[@"Juggle_normal",@"Model_normal",@"Design_normal"];
    }
    return _iconArr;
}

-(NSArray *)mainSubArr
{
    if (!_mainSubArr) {
        _mainSubArr=@[@"3D 积木工坊",@"CAD 建模",@"创意手绘"];
    }
    return _mainSubArr;
}

-(NSArray *)colorArr
{
    if (!_colorArr) {
        UIColor *color1 = RGBColor(61, 180, 90);
        UIColor *color2 = RGBColor(248, 76, 32);
        UIColor *color3 = RGBColor(29, 187, 235);
        _colorArr=@[color1,color2,color3];
    }
    return _colorArr;
}

-(NSArray *)subArr
{
    if (!_subArr) {
        NSString *str = @"制作您的专属 3D 积木模型，使用手指来放置小积木，当您完成了你的设计后，您可以用它生成模型文件以供打印，您只需保存完成后的网页链接，您便可以在其他设备上重现您的设计。";
        NSString *CADStr = @"CAD 建模只需要三步 (绘制平面图案，将平面生成三维，以及精细调整) 就可以完成建模，模型库还有更多等你来挑，让思维和创意碰撞，马上开始，让朋友们为你点赞！";
        NSString *designStr = @"能够将一张手绘的平面图形转化成可 3D 打印的 3D 模型，听起来很酷，但这已经成为现实，在这里，你只需绘制出想要的模型，即可打印出来，绘出新乐趣。";
        _subArr = @[str, CADStr, designStr];
    }
    return _subArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.backgroundColor=backGroundColor;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.tableView];
    [_tableView registerClass:[TMXDesignCell class] forCellReuseIdentifier:designCellID];
}

//-(void)viewWillLayoutSubviews{
//    [self updateViewConstraints];
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.iconArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TMXDesignCell *designCell=[tableView dequeueReusableCellWithIdentifier:designCellID forIndexPath:indexPath];
    designCell.iconURL=self.iconArr[indexPath.section];
    designCell.mainSubText = self.mainSubArr[indexPath.section];
    designCell.subText = self.subArr[indexPath.section];
    designCell.mainTextColor = self.colorArr[indexPath.section];
    designCell.selectionStyle=UITableViewCellSelectionStyleNone;
    designCell.isUpdateUI=YES;
    return designCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TMXPrinterControlVC *printerVC=[TMXPrinterControlVC new];
    [self.navigationController pushViewController:printerVC animated:YES];
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}
@end
