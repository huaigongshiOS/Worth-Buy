//
//  DataRequest.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "DataRequest.h"
#import "AFNetworking.h"
#import "Item.h"

@implementation DataRequest
-(void)requestData:(NSString *)urlString
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];//解析的类型
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        [self.delegate passValue:responseObject];
        //                NSArray *array = responseObject[@"items"];
        //
        //                for (NSDictionary *dic in array) {
        //                    Item *item = [[Item alloc] initWithDic:dic];
        //                    [self.dataArray addObject:model];
        //                }
        //                [table reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

@end
