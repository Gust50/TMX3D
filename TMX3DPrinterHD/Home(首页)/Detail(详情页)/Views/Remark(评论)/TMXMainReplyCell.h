//
//  TMXMainReplyCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMXHomeModelDetailCommentMainListModel;

@interface TMXMainReplyCell : UITableViewCell
@property (nonatomic, strong) TMXHomeModelDetailCommentMainListModel *mainReplyModel;   ///<一级评论模型数据
@end
