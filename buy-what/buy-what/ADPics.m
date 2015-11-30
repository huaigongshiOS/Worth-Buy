//
//  ADPics.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "ADPics.h"

@implementation ADPics
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.pic = dic[@"img"];
        self.url = dic[@"link"];
    }
    return self;
}
@end
