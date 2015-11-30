//
//  NewsArticle.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "NewsArticle.h"

@implementation NewsArticle
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.article_id = [dic objectForKey:@"article_id"];
        self.article_date  = [dic objectForKey:@"article_date"];
        self.article_link = [dic objectForKey:@"article_link"];
        self.article_format_date = [dic objectForKey:@"article_format_date"];
        self.article_price = [dic objectForKey:@"article_price"];
        self.article_comment = [dic objectForKey:@"article_comment"];
        self.article_favorite = [dic objectForKey:@"article_favorite"];
        self.article_title = [dic objectForKey:@"article_title"];
        self.article_rzlx = [dic objectForKey:@"article_rzlx"];
        self.article_pic = [dic objectForKey:@"article_pic"];
        self.article_filter_content = [dic objectForKey:@"article_filter_content"];
        if([[dic objectForKey:@"article_price"] isKindOfClass:[NSNull class]]){
            self.article_price = @"";
        }
    }
    return self;
}

@end
