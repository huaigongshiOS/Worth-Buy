//
//  RecommenViewController.m
//  smzdm
//
//  Created by 陈行 on 15/11/23.
//  Copyright © 2015年 Clugiaaa. All rights reserved.
//

#import "RecommenViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "Banner.h"
#import "Article.h"
#import "StyleOneTableViewCell.h"
#import "StyleTwoTableViewCell.h"
#import "WebViewController.h"
@interface RecommenViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>
{
    int limit;
    BOOL tag;
}
@end

@implementation RecommenViewController
- (NSMutableArray*)bannerlist{
    if (_bannerlist == nil) {
        _bannerlist = [NSMutableArray arrayWithCapacity:0];
    }
    return _bannerlist;
}
- (NSMutableArray*)articlelist{
    if (_articlelist == nil) {
        _articlelist = [NSMutableArray arrayWithCapacity:0];
    }
    return _articlelist;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    limit = 20;
    [self analysisBanner];
    [self analysisArticle];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    _TableView.delegate = self;
    _TableView.dataSource = self;
    tag = NO;
    _TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_TableView reloadData];
            [_TableView.mj_header endRefreshing];
        });
    }];
    _TableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            limit += 20;
            [self analysisArticle];
             [_TableView reloadData];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_TableView.mj_footer endRefreshing];
            });
        });
    }];
//    [_TableView reloadData];
        // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)analysisArticle{
    NSString *urlone = @"https://api.smzdm.com/v1/youhui/articles/?limit=";
    NSString *url = [NSString stringWithFormat:@"%@%d",urlone,limit];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *souresdic = responseObject[@"data"];
        NSArray *ary = [souresdic objectForKey:@"rows"];

        for (NSDictionary *dic in ary) {
            Article *art = [[Article alloc] initWithDic:dic];
            [self.articlelist addObject:art];
        }
        [_TableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}


- (void)analysisBanner{
    NSString *url = @"https://api.smzdm.com/v2/util/banner/?type=youhui&f=android";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *souresdic = responseObject[@"data"];
        NSArray *ary = [souresdic objectForKey:@"little_banner"];
        for (NSDictionary *dic in ary) {
            Banner *ban = [[Banner alloc] initWithDic:dic];
            [self.bannerlist addObject:ban];
        }
        [_TableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
#pragma <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _articlelist.count+1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        StyleOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"style1"];
        if (tag == NO) {
            Banner *ban = [_bannerlist objectAtIndex:0];
            if (ban) {
            cell.Banner1.userInteractionEnabled = YES;
            }
            cell.Banner1.layer.masksToBounds = YES;
            cell.Banner1.layer.borderColor = [[UIColor blackColor] CGColor];
            cell.Banner1.layer.borderWidth = 1.0f;
            cell.Banner1.layer.cornerRadius = 5;
            cell.Banner2.layer.masksToBounds = YES;
            cell.Banner2.layer.borderColor = [[UIColor blackColor] CGColor];
            cell.Banner2.layer.borderWidth = 1.0f;
            cell.Banner2.layer.cornerRadius = 5;
            cell.Banner3.layer.masksToBounds = YES;
            cell.Banner3.layer.borderColor = [[UIColor blackColor] CGColor];
            cell.Banner3.layer.borderWidth = 1.0f;
            cell.Banner3.layer.cornerRadius = 5;
            [cell.Banner1 sd_setImageWithURL:[NSURL URLWithString:ban.img]];
            Banner *ban1 = [_bannerlist objectAtIndex:1];
            [cell.Banner2 sd_setImageWithURL:[NSURL URLWithString:ban1.img]];
            Banner *ban2 = [_bannerlist objectAtIndex:2];
            [cell.Banner3 sd_setImageWithURL:[NSURL URLWithString:ban2.img]];

        }
        
        return cell;
    }
    else{
        StyleTwoTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"style2"forIndexPath:indexPath];
        Article *art = [self.articlelist objectAtIndex:indexPath.row-1];
        cell2.name.text = art.article_title;
        [cell2.img sd_setImageWithURL:[NSURL URLWithString:art.article_pic]];
        cell2.price.text = art.article_price;
        cell2.mall.text = art.article_mall;
        cell2.conmend.text = art.article_comment;
        cell2.img.layer.masksToBounds = YES;
        cell2.img.layer.borderColor = [[UIColor blackColor] CGColor];
        cell2.img.layer.borderWidth = 1.0f;
        cell2.img.layer.cornerRadius = 5;
        cell2.worth.text = [NSString stringWithFormat:@"喜欢:%d", (([art.article_unworthy intValue]-[art.article_worthy intValue]))];
        return cell2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        return 150;
    }
    return 100;
}
- (IBAction)abc:(id)sender {
    NSLog(@"123");
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row!=0)
    {
    Article *atr =[self.articlelist objectAtIndex:indexPath.row-1];
     _request = [NSURLRequest requestWithURL:[NSURL URLWithString:atr.article_link]];
//    [_Detail loadRequest:_request];
    
    
    WebViewController *web = [[WebViewController alloc] init];
    
    web.request = _request;
//    [self.navigationController popToViewController:web animated:YES];
    [self.navigationController pushViewController:web animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
