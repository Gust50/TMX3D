//
//  TMXHomeModelListCell.m
//  TMX3DPrinter
//
//  Created by kobe on 16/8/29.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXHomeModelListCell.h"
#import "TMXHomeModelDetailModel.h"

@interface TMXHomeModelListCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *suppliesLab;
@property (nonatomic, strong) UIButton *printBtn;
@end


@implementation TMXHomeModelListCell

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"Layer"];
    }
    return _icon;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[UILabel new];
        _nameLab.textColor = RGBColor(64, 64, 64);
        _nameLab.font = [UIFont systemFontOfSize:12];
        _nameLab.text = @"小黄人的眼镜";
    }
    return _nameLab;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab=[UILabel new];
        _timeLab.textColor = RGBColor(154, 154, 154);
        _timeLab.font = [UIFont systemFontOfSize:10];
        _timeLab.text = @"耗时：03时20分";
    }
    return _timeLab;
}

-(UILabel *)suppliesLab{
    if (!_suppliesLab) {
        _suppliesLab=[UILabel new];
        _suppliesLab.textColor = RGBColor(154, 154, 154);
        _suppliesLab.font = [UIFont systemFontOfSize:10];
        _suppliesLab.text = @"耗材：155mm";
    }
    return _suppliesLab;
}

-(UIButton *)printBtn{
    if (!_printBtn) {
        _printBtn=[UIButton buttonWithType:0];
        _printBtn.backgroundColor = systemColor;
        _printBtn.layer.cornerRadius = 5;
        _printBtn.layer.masksToBounds = YES;
        [_printBtn setTitle:@"打印" forState:UIControlStateNormal];
        [_printBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _printBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_printBtn addTarget:self action:@selector(printer) forControlEvents:UIControlEventTouchUpInside];
    }
    return _printBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = backGroundColor;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    [self addSubview:self.icon];
    [self addSubview:self.nameLab];
    [self addSubview:self.timeLab];
    [self addSubview:self.suppliesLab];
    [self addSubview:self.printBtn];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_printBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.bottom.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_printBtn.mas_left).with.offset(-5);
        make.height.mas_equalTo(@(20));
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.top.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_suppliesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLab.mas_right).with.offset(5);
        make.top.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
}

//打印
- (void)printer
{
    if (self.modelDetailPrinterBlock) {
        self.modelDetailPrinterBlock();
    }
}

#pragma mark - setter getter
-(void)setFileListModel:(TMXHomeModelDetailFileListModel *)fileListModel
{
    _fileListModel = fileListModel;
    [_icon sd_setImageWithURL:[NSURL URLWithString:fileListModel.image] placeholderImage:nil];
    _nameLab.text = fileListModel.fileName;
    if (fileListModel.printTime.length) {
//        NSString *_consuming = NSLocalizedString(@"Consuming", nil);
        _timeLab.text = [NSString stringWithFormat:@"耗时：%@", fileListModel.printTime];
        [NSString labelString:_timeLab font:[UIFont systemFontOfSize:10] range:NSMakeRange(3, _timeLab.text.length-3) color:systemColor];
    }else
    {
//        NSString *_consuming = NSLocalizedString(@"Consuming", nil);
        _timeLab.text = @"耗时：";
    }
    
    if (fileListModel.filamentUsed.length) {
//        NSString *_consumables = NSLocalizedString(@"Consumables", nil);
        _suppliesLab.text = [NSString stringWithFormat:@"耗材：%@", fileListModel.filamentUsed];
        [NSString labelString:_suppliesLab font:[UIFont systemFontOfSize:10] range:NSMakeRange(3, _suppliesLab.text.length-3) color:systemColor];
    }else
    {
//        NSString *_consumables = NSLocalizedString(@"Consumables", nil);
        _suppliesLab.text = @"耗材：";
    }
    
}

@end
