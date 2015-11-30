//
//  NewsDetailTableViewController.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsArticle.h"
@interface NewsDetailTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIImageView *picImage;

@property (nonatomic,strong) NewsArticle *model;

@end
