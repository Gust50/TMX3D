//
//  TMXInfoPhotoCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/12.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXInfoPhotoCell.h"


@interface TMXInfoPhotoCell ()

@property (nonatomic, strong) UILabel *cameraLab;
@property (nonatomic, strong) UIImageView *arrowOne;
@property (nonatomic, strong) UIView *middleLine;
@property (nonatomic, strong) UILabel *photoLab;
@property (nonatomic, strong) UIImageView *arrowTwo;
@property (nonatomic, strong) UIButton *cameraBtn;
@property (nonatomic, strong) UIButton *photoBtn;
@end

@implementation TMXInfoPhotoCell

-(UIImageView *)icon{
    if (!_icon) {
        _icon=[UIImageView new];
        _icon.image = [UIImage imageNamed:@"ReplaceIcon"];
        _icon.layer.cornerRadius = 40;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

-(UILabel *)cameraLab{
    if (!_cameraLab) {
        _cameraLab=[UILabel new];
        _cameraLab.font = [UIFont systemFontOfSize:12];
        _cameraLab.textAlignment = NSTextAlignmentRight;
        _cameraLab.textColor = [UIColor lightGrayColor];
        _cameraLab.text = @"拍照";
    }
    return _cameraLab;
}

-(UIImageView *)arrowOne{
    if (!_arrowOne) {
        _arrowOne=[UIImageView new];
        _arrowOne.image = [UIImage imageNamed:@"DetailArow"];
    }
    return _arrowOne;
}

-(UIView *)middleLine{
    if (!_middleLine) {
        _middleLine=[UIView new];
        _middleLine.backgroundColor = RGBColor(201, 199, 204);
    }
    return _middleLine;
}

-(UILabel *)photoLab{
    if (!_photoLab) {
        _photoLab=[UILabel new];
        _photoLab.font = [UIFont systemFontOfSize:12];
        _photoLab.textAlignment = NSTextAlignmentRight;
        _photoLab.textColor = [UIColor lightGrayColor];
        _photoLab.text = @"本地相册";
    }
    return _photoLab;
}

-(UIImageView *)arrowTwo{
    if (!_arrowTwo) {
        _arrowTwo=[UIImageView new];
        _arrowTwo.image = [UIImage imageNamed:@"DetailArow"];
    }
    return _arrowTwo;
}

-(UIButton *)cameraBtn{
    if (!_cameraBtn) {
        _cameraBtn=[UIButton buttonWithType:0];
        [_cameraBtn addTarget:self action:@selector(camera) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.backgroundColor = [UIColor clearColor];
    }
    return _cameraBtn;
}

-(UIButton *)photoBtn{
    if (!_photoBtn) {
        _photoBtn=[UIButton buttonWithType:0];
        [_photoBtn addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchUpInside];
        _photoBtn.backgroundColor = [UIColor clearColor];
    }
    return _photoBtn;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}


-(void)initUI{
    [self addSubview:self.icon];
    [self addSubview:self.cameraLab];
    [self addSubview:self.arrowOne];
    [self addSubview:self.middleLine];
    [self addSubview:self.arrowTwo];
    [self addSubview:self.photoLab];
    
    [self addSubview:self.cameraBtn];
    [self addSubview:self.photoBtn];
    [self updateConstraints];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    [_icon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_cameraLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowOne.mas_left).with.offset(-10);
        make.top.equalTo(weakSelf.mas_top);
        make.bottom.equalTo(_middleLine.mas_top);
        make.left.equalTo(_icon.mas_right).with.offset(10);
    }];
    
    [_arrowOne mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-270);
        make.centerY.equalTo(_cameraLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [_middleLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(_icon.mas_right).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [_photoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowTwo.mas_left).with.offset(-10);
        make.top.equalTo(_middleLine.mas_bottom);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(_icon.mas_right).with.offset(10);
    }];
    
    [_arrowTwo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-270);
        make.centerY.equalTo(_photoLab.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [_cameraBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.bottom.equalTo(_middleLine.mas_top);
        make.left.equalTo(_icon.mas_right).with.offset(10);
    }];
    
    [_photoBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_middleLine.mas_bottom);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.left.equalTo(_icon.mas_right).with.offset(10);
    }];
}

//拍照
- (void)camera
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCamera)]) {
        [self.delegate clickCamera];
    }
}

//本地相册
- (void)photo
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickPhoto)]) {
        [self.delegate clickPhoto];
    }
}

@end
