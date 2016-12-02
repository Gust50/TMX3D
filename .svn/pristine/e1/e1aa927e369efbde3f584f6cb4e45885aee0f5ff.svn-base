//
//  TMXReplyCommentCell.m
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import "TMXReplyCommentCell.h"
#import "TMXHomeModelDetailModel.h"


@interface TMXReplyCommentCell ()
@property (nonatomic, strong) UILabel *commentLab;
@end

@implementation TMXReplyCommentCell

-(UILabel *)commentLab{
    if (!_commentLab) {
        _commentLab=[UILabel new];
    }
    return _commentLab;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.commentLab];
    //auto calculator height
    self.lastviewInCell=self.commentLab;
    self.bottomOffsetToCell=5.0;
}


-(void)updateConstraints{
    [super updateConstraints];
    
    WS(weakSelf);
    
    [_commentLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.top.equalTo(weakSelf.mas_top).with.offset(5);
    }];
    
    //自动换行
    _commentLab.preferredMaxLayoutWidth=weakSelf.width-10;
}


#pragma mark <getter setter>
-(void)setCommentModel:(TMXHomeModelDetailCommentListModel *)commentModel{
    _commentModel=commentModel;
    NSString *replyContentStr=[NSString stringWithFormat:@"%@@%@:%@",commentModel.fromUserName,commentModel.toUserName,commentModel.comment];
    
    NSMutableAttributedString *text=[[NSMutableAttributedString alloc]initWithString:replyContentStr];
    [text addAttribute:NSForegroundColorAttributeName
                 value:systemColor
                 range:NSMakeRange(0, commentModel.fromUserName.length)];
    [text addAttribute:NSForegroundColorAttributeName
                 value:systemColor
                 range:NSMakeRange(commentModel.fromUserName.length+1, commentModel.toUserName.length)];
    _commentLab.attributedText=text;
    
    //更新布局
    [self setNeedsUpdateConstraints];
}

@end
