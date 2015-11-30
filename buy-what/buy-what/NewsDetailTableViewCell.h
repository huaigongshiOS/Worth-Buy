//
//  NewsDetailTableViewCell.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *l_rzlx;
@property (strong, nonatomic) IBOutlet UILabel *l_date;
@property (strong, nonatomic) IBOutlet UILabel *l_title;
@property (strong, nonatomic) IBOutlet UITextView *l_content;
- (void)setContent:(NSString *)string;
@end
