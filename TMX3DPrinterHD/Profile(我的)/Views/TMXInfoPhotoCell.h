//
//  TMXInfoPhotoCell.h
//  TMX3DPrinterHD
//
//  Created by kobe on 16/11/12.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMXInfoPhotoCellDelegate <NSObject>

- (void)clickPhoto;
- (void)clickCamera;

@end
@interface TMXInfoPhotoCell : UITableViewCell

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, weak)id<TMXInfoPhotoCellDelegate>delegate;

@end
