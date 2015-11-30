//
//  CustomCollectionViewCell.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *fromLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *commentsNumberLabel;
@property (nonatomic,strong) UIImageView *itemImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *betweenLabel;
@property (nonatomic,strong) UIImageView *commentImageView;
-(void)setString:(NSString *)mail;

@end
