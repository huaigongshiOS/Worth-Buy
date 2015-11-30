//
//  CustomCollectionViewCell.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, self.frame.size.width-10, 120)];
        [self addSubview:self.itemImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 150, self.frame.size.width-35, 50)];
        self.nameLabel.numberOfLines = 2;
        [self addSubview:self.nameLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 210, self.frame.size.width - 40, 20)];
        [self addSubview:self.priceLabel];
        
        self.fromLabel = [[UILabel alloc] initWithFrame:CGRectMake( 15, 240, 50, 10)];
        UIFont *font = [UIFont fontWithName:@"Arial" size:12];
        self.fromLabel.font = font;
        [self addSubview:self.fromLabel];
        
        self.betweenLabel = [[UILabel alloc] initWithFrame:CGRectMake(67, 240, 5, 10)];
        self.betweenLabel.text = @"|";
        [self addSubview:self.betweenLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 240, 50, 10)];
        self.timeLabel.font = font;
        [self addSubview:self.timeLabel];
        
        self.commentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, 240, 10, 10)];
        self.commentImageView.image = [UIImage imageNamed:@"detail_bottom_comment"];
        [self addSubview:self.commentImageView];
        
        self.commentsNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 15 , 240, 10, 10)];
        self.commentsNumberLabel.font = font;
        [self addSubview:self.commentsNumberLabel];
        
    }
    return self;
}
-(void)setString:(NSString *)mail
{
    self.fromLabel.text = mail;
    [self.fromLabel sizeToFit];
    
    if (self.fromLabel.frame.size.width+self.fromLabel.frame.origin.x > self.frame.size.width / 2.0 ) {
        self.fromLabel.frame = CGRectMake( 15, 240, 50, 10);
    }
    else
    {
    self.betweenLabel.frame = CGRectMake(self.fromLabel.frame.size.width+self.fromLabel.frame.origin.x +3, 240, 5, 10);
    self.timeLabel.frame = CGRectMake(self.betweenLabel.frame.size.width + self.betweenLabel.frame.origin.x + 2, 240, 40, 10);
    }
}
@end
