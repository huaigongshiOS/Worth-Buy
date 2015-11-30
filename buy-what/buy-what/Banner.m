//
//  Banner.m
//  smzdm
//
//  Created by 陈行 on 15/11/25.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import "Banner.h"

@implementation Banner
-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        self.img = [dic objectForKey: @"img"];
        self.title = [dic objectForKey:@"title"];
        self.link = [dic objectForKey:@"link"];
    }
    return  self;
}
@end
