//
//  Article.m
//  smzdm
//
//  Created by 陈行 on 15/11/25.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import "Article.h"

@implementation Article
-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.article_id = [dic objectForKey:@"article_id"];
        self.article_date  = [dic objectForKey:@"article_date"];
        self.article_link = [dic objectForKey:@"article_link"];
        self.article_mall = [dic objectForKey:@"article_mall"];
        self.article_price = [dic objectForKey:@"article_price"];
        self.article_unworthy = [dic objectForKey:@"article_unworthy"];
        self.article_worthy = [dic objectForKey:@"article_worthy"];
        self.article_title = [dic objectForKey:@"article_title"];
        self.article_pic = [dic objectForKey:@"article_pic"];
    }
    return self;
}
@end
