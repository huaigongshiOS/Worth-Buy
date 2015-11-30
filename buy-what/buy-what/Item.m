//
//  Item.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "Item.h"

@implementation Item
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.article_collection = [dic objectForKey:@"article_collection"];
        self.article_format_date = [dic objectForKey:@"article_format_date"];
        self.article_id = [dic objectForKey:@"article_id"];
        self.article_mall = [dic objectForKey:@"article_mall"];
        self.article_pic = [dic objectForKey:@"article_pic"];
        self.article_price = [dic objectForKey:@"article_price"];
        self.article_title = [dic objectForKey:@"article_title"];
        self.article_favorite = [dic objectForKey:@"article_favorite"];
        self.article_url = [dic objectForKey:@"article_url"];
        self.article_collection = [dic objectForKey:@"article_collection"];
    }
    return self;
}
@end
