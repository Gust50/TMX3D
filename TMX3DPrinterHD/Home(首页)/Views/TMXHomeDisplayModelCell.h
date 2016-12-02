//
//  TMXHomeDisplayModelCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/10/24.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMXHomeCategoryModelListListModel;
@class TMXHomeClassifyListListModel;
@class TMXHomeSearchListModel;
@class TMXLikeListModel;
@class TMXCollectListModel;
@interface TMXHomeDisplayModelCell : UICollectionViewCell

@property (nonatomic, strong)TMXHomeCategoryModelListListModel *categryListModel;   ///首页分类列表
@property (nonatomic, strong)TMXHomeClassifyListListModel *clasifyListModel;        ///<分类展览列表
@property (nonatomic, strong)TMXHomeSearchListModel *searchListModel;               ///<搜索模型
@property (nonatomic, strong)TMXLikeListModel *likeListModel;                       ///<喜欢模型列表
@property (nonatomic, strong)TMXCollectListModel *collectListModel;                 ///<收藏模型列表
@end
