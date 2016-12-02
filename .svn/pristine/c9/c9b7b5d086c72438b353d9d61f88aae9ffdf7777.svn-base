//
//  TMXBindPrintingTaskListTableViewCell.m
//  TMX3DPrinterHD
//
//  Created by arom on 16/11/4.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXBindPrintingTaskListTableViewCell.h"

@interface TMXBindPrintingTaskListTableViewCell ()
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation TMXBindPrintingTaskListTableViewCell

#pragma mark <lazy load>
- (UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 3;
        _iconImageView.image = [UIImage imageNamed:@"Model_normal"];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel{
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColor(53, 53, 53);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"主线程vbnm";
    }
    return _nameLabel;
}

- (UILabel *)timeTakingLabel{
    
    if (!_timeTakingLabel) {
        _timeTakingLabel = [[UILabel alloc] init];
        _timeTakingLabel.font = [UIFont systemFontOfSize:12];
        _timeTakingLabel.text = @"耗时:03时20分";
    }
    return _timeTakingLabel;
}

- (UILabel *)materialTakeingLabel{
    
    if (!_materialTakeingLabel) {
        _materialTakeingLabel = [[UILabel alloc] init];
        _materialTakeingLabel.font = [UIFont systemFontOfSize:12];
        _materialTakeingLabel.text = @"耗材:1000000mm";
    }
    return _materialTakeingLabel;
}


- (KBtopImgBottomTextBtn *)cancelTaskBtn{
    
    if (!_cancelTaskBtn) {
        _cancelTaskBtn = [[KBtopImgBottomTextBtn alloc] init];
        _cancelTaskBtn.nameContent = @"打印机中心";
        _cancelTaskBtn.textColor = RGBColor(53, 53, 53);
        _cancelTaskBtn.textFont = [UIFont systemFontOfSize:12];
        _cancelTaskBtn.iconUrl = @"GoPrintCenter";
    }
    return _cancelTaskBtn;
}

- (KBtopImgBottomTextBtn *)taskSaveBtn{
    
    if (!_taskSaveBtn) {
        _taskSaveBtn = [[KBtopImgBottomTextBtn alloc] init];
        _taskSaveBtn.nameContent = @"取消任务";
        _taskSaveBtn.textColor = RGBColor(53, 53, 53);
        _taskSaveBtn.textFont = [UIFont systemFontOfSize:12];
        _taskSaveBtn.iconUrl = @"TaskCancel";
    }
    return _taskSaveBtn;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine=[UIView new];
        _bottomLine.backgroundColor=RGBColor(228, 233, 234);
    }
    return _bottomLine;
}

#pragma mark <init>
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

#pragma mark <init UI>
- (void)initUI{
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.timeTakingLabel];
    [self addSubview: self.materialTakeingLabel];
    [self addSubview:self.cancelTaskBtn];
    [self addSubview:self.taskSaveBtn];
    [self addSubview:self.bottomLine];
    [self updateConstraints];
}

- (void)updateConstraints{
    
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.height.equalTo(@60);
        make.width.equalTo(@60);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).with.offset(8);
        make.bottom.equalTo(_iconImageView.mas_centerY).with.offset(-5);
        make.height.equalTo(@20);
    }];
    
    [_timeTakingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).with.offset(8);
        make.top.equalTo(_iconImageView.mas_centerY).with.offset(5);
        
    }];
    
    
    [_materialTakeingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeTakingLabel.mas_right).with.offset(20);
        make.centerY.equalTo(_timeTakingLabel.mas_centerY);
    }];
    
    [_taskSaveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-20);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@55);
        make.width.equalTo(@55);
    }];
    
    [_cancelTaskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_taskSaveBtn.mas_left).with.offset(0);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(@55);
        make.width.equalTo(@55);
    }];
    
    [_bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-1);
        make.height.mas_equalTo(@(1));
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
