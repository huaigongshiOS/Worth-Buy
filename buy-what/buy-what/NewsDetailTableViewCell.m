//
//  NewsDetailTableViewCell.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "NewsDetailTableViewCell.h"

@implementation NewsDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setContent:(NSString *)string{
    
    //    self.l_content.numberOfLines = 0;
    //    self.l_contect.frame = CGRectMake(5, self.firstLabel.frame.size.height+self.firstLabel.frame.origin.y, [[UIScreen mainScreen]bounds].size.width, 0);
    self.l_content.text = string;
    [self.l_content sizeToFit];
    
    
    //    self.height = self.l_contect.frame.size.height + self.l_contect.frame.origin.y;
    
}

@end
