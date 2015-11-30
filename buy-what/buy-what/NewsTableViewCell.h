//
//  NewsTableViewCell.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *l_date;
@property (strong, nonatomic) IBOutlet UILabel *l_comment;
@property (strong, nonatomic) IBOutlet UILabel *l_favorite;
@property (strong, nonatomic) IBOutlet UILabel *l_rzlx;
@property (strong, nonatomic) IBOutlet UILabel *goodcontect;
@property (strong, nonatomic) IBOutlet UIImageView *goodImage;

@end
