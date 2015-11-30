//
//  ADPics.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPics : NSObject
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSString *url;
-(instancetype)initWithDic:(NSDictionary *)dic;
@end
