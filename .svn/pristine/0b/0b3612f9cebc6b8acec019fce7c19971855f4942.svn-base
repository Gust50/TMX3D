//
//  TMXPrinterListTableViewCell.m
//  TMX3DPrinter
//
//  Created by arom on 16/8/26.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterListTableViewCell.h"
//#import "TMXPrinterListModel.h"


@interface TMXPrinterListTableViewCell ()
@property (nonatomic, strong) UIView *bottomLine;     ///<底部下划线
@end

@implementation TMXPrinterListTableViewCell

#pragma mark -- 懒加载
- (UIImageView *)printerImage{
    
    if (!_printerImage) {
        _printerImage = [[UIImageView alloc] init];
        _printerImage.image = [UIImage imageNamed:@"Printer_gray"];
    }
    return _printerImage;
}

- (UILabel *)nameLable{
    
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.textColor = RGBColor(51, 51, 51);
        _nameLable.font = [UIFont systemFontOfSize:15];
        _nameLable.text = @"隔壁老王老婆的打印机";
    }
    return _nameLable;
}

- (UILabel *)isDefault{

    if (!_isDefault) {
        _isDefault = [[UILabel alloc] init];
        _isDefault.text = @"默认";
        _isDefault.textColor = [UIColor whiteColor];
        _isDefault.backgroundColor = systemColor;
        _isDefault.layer.masksToBounds = YES;
        _isDefault.layer.cornerRadius = 5;
        _isDefault.font = [UIFont systemFontOfSize:13];
        _isDefault.textAlignment = NSTextAlignmentCenter;
        _isDefault.hidden = YES;
    }
    return _isDefault;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine=[UIView new];
        _bottomLine.backgroundColor=RGBColor(228, 233, 234);
    }
    return _bottomLine;
}


- (UILabel *)WIFIStateLabel{
    
    if (!_WIFIStateLabel) {
        _WIFIStateLabel = [[UILabel alloc] init];
        _WIFIStateLabel.textColor = RGBColor(102, 102, 102);
        _WIFIStateLabel.font = [UIFont systemFontOfSize:13];
        _WIFIStateLabel.text = @"已连接";
    }
    return _WIFIStateLabel;
}

//- (UILabel *)WIFILabel{
//    
//    if (!_WIFILabel) {
//        _WIFILabel = [[UILabel alloc] init];
//        _WIFILabel.textColor = RGBColor(102, 102, 102);
//        _WIFILabel.font = [UIFont systemFontOfSize:11*AppScale];
//        _WIFILabel.text = @"链接wifi：";
//    }
//    return _WIFILabel;
//}

- (UIButton *)selectButton{
    
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:0];
        [_selectButton setImage:[UIImage imageNamed:@"editPrinter"] forState:(UIControlStateNormal)];
        [_selectButton addTarget:self action:@selector(selectButtonCliked) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _selectButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    [self addSubview:self.printerImage];
    [self addSubview:self.nameLable];
    [self addSubview:self.isDefault];
    [self addSubview:self.WIFIStateLabel];
//    [self addSubview:self.WIFILabel];
    [self addSubview:self.selectButton];
    [self addSubview:self.bottomLine];
    
    [self updateConstraints];
}

- (void)selectButtonCliked{

    if (self.selectblock) {
        self.selectblock();
    }
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
    WS(weakSelf);
    [_printerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@(38));
        make.width.equalTo(@(30));
    }];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_printerImage.mas_right).with.offset(10);
        make.top.equalTo(_printerImage.mas_top);
        make.height.equalTo(@(20));
    }];
    
    [_isDefault mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_nameLable.mas_right).with.offset(5);
        make.centerY.equalTo(_nameLable.mas_centerY);
        make.height.equalTo(@(15));
        make.width.equalTo(@(30));
    }];
    
    [_WIFIStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_printerImage.mas_right).with.offset(10);
        make.bottom.equalTo(_printerImage.mas_bottom);
        make.height.equalTo(@(15));
        make.right.equalTo(_selectButton.mas_left).offset(10);
    }];
    
//    [_WIFILabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_WIFIStateLabel.mas_right).with.offset(10*AppScale);
//        make.bottom.equalTo(_printerImage.mas_bottom);
//        make.height.equalTo(@(15*AppScale));
//        make.right.equalTo(_selectButton.mas_left).with.offset(-10*AppScale);
//    }];
    
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.equalTo(@(60));
        
    }];
    
    [_bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-1);
        make.height.mas_equalTo(@(1));
    }];
    
}

#pragma mark - setter getter
//-(void)setPrinterListModel:(TMXPrinterListListModel *)printerListModel
//{
//    _printerListModel = printerListModel;
//    if (printerListModel.printerName.length) {
//        _nameLable.text = printerListModel.printerName;
//    }else
//    {
//        _nameLable.text = [NSString stringWithFormat:@"#%ld", printerListModel.printerListID];
//    }
//    
//    _WIFIStateLabel.text = [NSString stringWithFormat:@"状态：%@", printerListModel.status];
//    if ([printerListModel.status isEqualToString:@"离线"]) {
//        _WIFIStateLabel.textColor = RGBColor(102, 102, 102);
//    }else
//    {
//        [NSString labelString:_WIFIStateLabel font:[UIFont systemFontOfSize:11*AppScale] range:NSMakeRange(3, printerListModel.status.length) color:RGBColor(234, 97, 1)];
//    }
//    if (printerListModel.isDefault) {
//        _isDefault.hidden = NO;
//    }else
//    {
//        _isDefault.hidden = YES;
//    }
//}

//-(void)setSharePrinterList:(TMXPrinterListShareListModel *)sharePrinterList
//{
//    _sharePrinterList = sharePrinterList;
//    
//    if (sharePrinterList.printerName.length) {
//        _nameLable.text = sharePrinterList.printerName;
//    }else
//    {
//        _nameLable.text = [NSString stringWithFormat:@"#%ld", sharePrinterList.sharePrinterListID];
//    }
//    _WIFIStateLabel.text = [NSString stringWithFormat:@"状态：%@", sharePrinterList.status];
//    if ([sharePrinterList.status isEqualToString:@"离线"]) {
//        _WIFIStateLabel.textColor = RGBColor(102, 102, 102);
//    }else
//    {
//        [NSString labelString:_WIFIStateLabel font:[UIFont systemFontOfSize:11*AppScale] range:NSMakeRange(3, sharePrinterList.status.length) color:RGBColor(234, 97, 1)];
//    }
//    if (sharePrinterList.isDefault) {
//        _isDefault.hidden = NO;
//    }else
//    {
//        _isDefault.hidden = YES;
//    }
//}

@end
