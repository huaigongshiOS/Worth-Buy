//
//  RecommenViewController.h
//  smzdm
//
//  Created by 陈行 on 15/11/23.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommenViewController : UIViewController
@property (nonatomic,strong) NSMutableArray *bannerlist;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic,strong) NSMutableArray *articlelist;
@property (nonatomic,strong) NSURLRequest *request;
@property (nonatomic,strong) UIWebView *Detail;
@property (nonatomic,strong) NSMutableArray *bannerlink;
@end
