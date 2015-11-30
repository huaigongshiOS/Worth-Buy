//
//  DataRequest.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DataRequestDelegate <NSObject>

-(void)passValue:(id)sender;

@end

@interface DataRequest : NSObject
@property (weak,nonatomic) id<DataRequestDelegate> delegate;
-(void)requestData:(NSString *)urlString;

@end
