//
//  TMXReplyCommentCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/2.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMXHomeModelDetailCommentListModel;

@interface TMXReplyCommentCell : UITableViewCell
@property (nonatomic, strong) TMXHomeModelDetailCommentListModel *commentModel;   ///<三级评论模型
@end
