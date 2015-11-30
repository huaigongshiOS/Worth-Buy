//
//  NewsTableViewController.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRequest.h"
@interface NewsTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,DataRequestDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;

@end
