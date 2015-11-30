//
//  Article.h
//  smzdm
//
//  Created by 陈行 on 15/11/25.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
@property (nonatomic,strong) NSString *article_id;
@property (nonatomic,strong) NSString *article_price;
@property (nonatomic,strong) NSString *article_date;
@property (nonatomic,strong) NSString *article_link;
@property (nonatomic,strong) NSString *article_mall;
@property (nonatomic,strong) NSString *article_comment;
@property (nonatomic,strong) NSString *article_worthy;
@property (nonatomic,strong) NSString *article_unworthy;
@property (nonatomic,strong) NSString *article_title;
@property (nonatomic,strong) NSString *article_pic;
- (instancetype)initWithDic : (NSDictionary *)dic;
@end
