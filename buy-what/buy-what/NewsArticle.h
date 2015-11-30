//
//  NewsArticle.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsArticle : NSObject
@property (nonatomic, strong) NSString    *article_id;
@property (nonatomic, strong) NSString    *article_format_date;
@property (nonatomic, strong) NSString    *article_date;
@property (nonatomic, strong) NSString    *article_link;
@property (nonatomic, strong) NSString    *article_price;
@property (nonatomic, strong) NSString    *article_comment;
@property (nonatomic, strong) NSString    *article_favorite;
@property (nonatomic, strong) NSString    *article_title;
@property (nonatomic, strong) NSString    *article_rzlx ;
@property (nonatomic, strong) NSString    *article_filter_content ;
@property (nonatomic, copy)   NSString    *article_pic;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
