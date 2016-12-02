//
//  TMXPrinterHistoryCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXPrinterHistoryCell.h"
#import "KBtopImgBottomTextBtn.h"

@interface TMXPrinterHistoryCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *modelNameLab;
@property (nonatomic, strong) UILabel *useTimeLab;
@property (nonatomic, strong) UILabel *useMaterialLab;
@property (nonatomic, strong) UILabel *statusLab;
@property (nonatomic, strong) KBtopImgBottomTextBtn *printerBtn;
@property (nonatomic, strong) KBtopImgBottomTextBtn *deleteBtn;
@end

@implementation TMXPrinterHistoryCell

#pragma mark <getter setter>
-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"Layer"];
    }
    return _icon;
}

-(UILabel *)modelNameLab{
    if (!_modelNameLab) {
        _modelNameLab=[UILabel new];
        _modelNameLab.font = [UIFont systemFontOfSize:14];
        _modelNameLab.text = @"小黄人";
    }
    return _modelNameLab;
}


-(UILabel *)useTimeLab{
    if (!_useTimeLab) {
        _useTimeLab=[UILabel new];
        _useTimeLab.font = [UIFont systemFontOfSize:12];
        _useTimeLab.text = @"耗时：03时20分";
        _useTimeLab.textColor = RGBColor(122, 122, 122);
    }
    return _useTimeLab;
}

-(UILabel *)useMaterialLab{
    if (!_useMaterialLab) {
        _useMaterialLab=[UILabel new];
        _useMaterialLab.font = [UIFont systemFontOfSize:12];
        _useMaterialLab.text = @"耗材：125mm";
        _useMaterialLab.textColor = RGBColor(122, 122, 122);
    }
    return _useMaterialLab;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        _statusLab=[UILabel new];
        _statusLab.font = [UIFont systemFontOfSize:14];
        _statusLab.text = @"打印成功";
        _statusLab.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLab;
}

-(KBtopImgBottomTextBtn *)printerBtn{
    if (!_printerBtn) {
        _printerBtn=[KBtopImgBottomTextBtn new];
        _printerBtn.iconUrl = @"HistoryFilePrint";
        _printerBtn.nameContent = @"打印";
        _printerBtn.textColor = systemColor;
        _printerBtn.textFont = [UIFont systemFontOfSize:12];
        _printerBtn.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(printer)];
        [_printerBtn addGestureRecognizer:gesture];
    }
    return _printerBtn;
}

-(KBtopImgBottomTextBtn *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn=[KBtopImgBottomTextBtn new];
        _deleteBtn.iconUrl = @"DeleteHistoryRecord";
        _deleteBtn.nameContent = @"删除";
        _deleteBtn.textColor = systemColor;
        _deleteBtn.textFont = [UIFont systemFontOfSize:12];
        _deleteBtn.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(delete)];
        [_deleteBtn addGestureRecognizer:gesture];
    }
    return _deleteBtn;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.modelNameLab];
    [self addSubview:self.useTimeLab];
    [self addSubview:self.useMaterialLab];
    [self addSubview:self.statusLab];
    [self addSubview:self.printerBtn];
    [self addSubview:self.deleteBtn];
}

-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_modelNameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.right.equalTo(_statusLab.mas_left).with.offset(-5);
        make.bottom.equalTo(_icon.mas_centerY).with.offset(-3);
        make.height.mas_equalTo(@(15));
    }];
    
    [_useTimeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).with.offset(5);
        make.top.equalTo(_icon.mas_centerY).with.offset(3);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
    
    [_useMaterialLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_useTimeLab.mas_right).with.offset(5);
        make.top.equalTo(_icon.mas_centerY).with.offset(3);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
    
    [_statusLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(60, 15));
    }];
    
    [_deleteBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [_printerBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_deleteBtn.mas_left).with.offset(-5);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
}

//打印
- (void)printer
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(printFile)]) {
        [self.delegate printFile];
    }
}

//删除
- (void)delete
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteFile)]) {
        [self.delegate deleteFile];
    }
}

@end
