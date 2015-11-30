//
//  Item.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic,strong) NSString *article_comment;
@property (nonatomic,strong) NSString *article_format_date;
@property (nonatomic,strong) NSString *article_id;
@property (nonatomic,strong) NSString *article_mall;
@property (nonatomic,strong) NSString *article_pic;
@property (nonatomic,strong) NSString *article_price;
@property (nonatomic,strong) NSString *article_title;
@property (nonatomic,strong) NSString *article_url;
@property (nonatomic,strong) NSString *article_favorite;
@property (nonatomic,strong) NSString *article_collection;
-(instancetype)initWithDic:(NSDictionary *)dic;
@end
