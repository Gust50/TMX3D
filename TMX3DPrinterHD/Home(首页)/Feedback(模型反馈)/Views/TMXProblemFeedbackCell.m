//
//  TMXProblemFeedbackCell.m
//  TMX3DPrinter
//
//  Created by wutaobo on 16/9/18.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXProblemFeedbackCell.h"
#import "TMXFeedbackModel.h"

@interface TMXProblemFeedbackCell ()
{
    CGFloat commentHeight;
}

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UILabel *comment;

@end
@implementation TMXProblemFeedbackCell

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.image = [UIImage imageNamed:@"ReplaceIcon"];
        _icon.layer.cornerRadius = 15;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

-(UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"天马星";
        _name.font = [UIFont systemFontOfSize:14];
    }
    return _name;
}

-(UILabel *)time
{
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.text = @"2016-08-08 12:30";
        _time.font = [UIFont systemFontOfSize:11];
        _time.textColor = RGBColor(160, 160, 160);
    }
    return _time;
}

-(UILabel *)comment
{
    if (!_comment) {
        _comment = [[UILabel alloc] init];
        _comment.text = @"收到了；发凯撒的积分奇偶的房间里送了肯定是接发炮弹就发哦老师的；分开就爱上打开；发";
        _comment.font = [UIFont systemFontOfSize:12];
        _comment.numberOfLines = 0;
    }
    return _comment;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.time];
    [self addSubview:self.comment];
    
    [self updateConstraints];
}

-(void)updateConstraints
{
    [super updateConstraints];
    
    WS(weakSelf);
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(_icon.mas_centerY);
        make.height.mas_equalTo(@(15));
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_icon.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.left.equalTo(_icon.mas_right).offset(10);
        make.height.mas_equalTo(@(15));
    }];
    
    [_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-20);
        make.top.equalTo(_icon.mas_bottom).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
        make.left.equalTo(weakSelf.mas_left).offset(20);
    }];
    
}

#pragma mark - setter getter
-(void)setListModel:(TMXFeedbackListModel *)listModel
{
    _listModel = listModel;
//    [_icon sd_setImageWithURL:[NSURL URLWithString:listModel.userAvatar] placeholderImage:nil];
//    _name.text = listModel.userName;
//    if (listModel.createdDate.length) {
//        NSDate *date = [[KBDateFormatter shareInstance]dateFromTimeInterval:([listModel.createdDate doubleValue]/1000.0)];
//        _time.text = [NSDate caculatorTime:date];
//    }else
//    {
//        _time.text = @"";
//    }
//    
//    _comment.text = listModel.comment;
//    CGSize size = [NSString sizeWithStr:_comment.text font:[UIFont systemFontOfSize:12*AppScale] width:SCREENWIDTH-20*AppScale];
//    commentHeight = size.height;
}

@end
