//
//  Banner.h
//  smzdm
//
//  Created by 陈行 on 15/11/25.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *link;
- (instancetype)initWithDic: (NSDictionary *)dic;
@end
