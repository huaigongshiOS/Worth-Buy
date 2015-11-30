//
//  HeaderCollectionReusableView.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "HeaderCollectionReusableView.h"
#import "ADPics.h"
#import "UIImageView+WebCache.h"

@implementation HeaderCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    self.location = 0;
    self.flag = true;
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:self.frame];
        [self addSubview:headerView];
        
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width , self.frame.size.height);
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 5, self.frame.size.height);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.tag = 120;
        [self addSubview:self.scrollView];
        
        
        
        
        
    }
    return self;
}
-(void)changePage
{
    self.location++;
    UIScrollView *s = (UIScrollView *) [self viewWithTag:120];
    UIPageControl *p = (UIPageControl *) [self viewWithTag:110];
    if (self.location < self.array.count - 1) {
        
        p.currentPage = self.location ;
        s.contentOffset = CGPointMake(self.frame.size.width * self.location, 0);
    }
    else
    {
        s.contentOffset = CGPointMake(0, 0);
        p.currentPage = 0;
        self.location = 0;
    }
}
-(void)loadImageView
{
    for (int i = 0; i < self.array.count; i++) {
        ADPics *p = self.array[i];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 200+i;
        imageView.frame = CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height);
        [imageView sd_setImageWithURL:[NSURL URLWithString:p.pic] placeholderImage:nil];
        [self.scrollView addSubview:imageView];
    }
    if (_flag) {
        if (self.array.count > 0) {
            
            UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0 - 70, self.frame.size.height-20, 160, 10)];
            pageControl.tag = 110;
            
            pageControl.numberOfPages = self.array.count;
            [self addSubview:pageControl];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
            self.flag =false;
        }
    }
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIPageControl *p = (UIPageControl *) [self viewWithTag:110];
    p.currentPage = scrollView.contentOffset.x / self.frame.size.width;
    self.location = p.currentPage;
}

@end
