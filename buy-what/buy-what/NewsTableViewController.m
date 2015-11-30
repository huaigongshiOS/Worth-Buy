//
//  NewsTableViewController.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewCell.h"
#import "NewsArticle.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "NewsDetailTableViewController.h"

static NSString *cellIndentifier = @"cell";

@interface NewsTableViewController ()
{
    int page;
    int day;
}

@end

@implementation NewsTableViewController
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataRequest *request = [[DataRequest alloc]init];
    request.delegate = self;
    page = 1;
    day = 9;
    [request requestData:[NSString stringWithFormat:@"http://api.smzdm.com/v1/news/articles?f=iphone&imgmode=0&limit=20&v=6.0.1&weixin=1"]];
    
    [self.tableView addHeaderWithTarget:self action:@selector(tableViewHeaderRefresh)];
    
    [self.tableView addFooterWithTarget:self action:@selector(tableViewFooterRefresh)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)tableViewHeaderRefresh{
    
    DataRequest *request = [[DataRequest alloc]init];
    request.delegate = self;
    [self.dataArray removeAllObjects];
    [request requestData:[NSString stringWithFormat:@"http://api.smzdm.com/v1/news/articles?f=iphone&imgmode=0&limit=20&v=6.0.1&weixin=1"]];
    [self.tableView headerEndRefreshing];
        
}
- (void)tableViewFooterRefresh{
    
    DataRequest *request = [[DataRequest alloc]init];
    request.delegate = self;
    
    NSString *s = @"http://api.smzdm.com/v1/news/articles?article_date=2015-11-2";
    NSString *a = [NSString stringWithFormat:@"%d",day];
    day--;
    NSString *s1 = [s stringByAppendingString:a];
    NSString *s2 = [s1 stringByAppendingString:@"%2012%3A06%3A45&f=iphone&imgmode=0&limit=20&page="];
    page++;
    NSString *b =[NSString stringWithFormat:@"%d",page];
    NSString *s3 = [s2 stringByAppendingString:b];
    NSString *s4 = [s3 stringByAppendingString:@"&v=6.0.1&weixin=1"];
    [request requestData:s4];
    
    [self.tableView footerEndRefreshing];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)passValue:(id)sender{
    
    //    UITableView *tableView = (UITableView *)[self.view viewWithTag:100];
    NSDictionary *d = sender[@"data"];
    NSArray *array = d[@"rows"];
    for (NSDictionary *dic in array) {
        NewsArticle *model = [[NewsArticle alloc]initWithDic:dic];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    NewsArticle *news = [[NewsArticle alloc]init];
    news = self.dataArray[indexPath.row];
    
    [cell.goodImage sd_setImageWithURL:[NSURL URLWithString:news.article_pic] placeholderImage:nil];
    cell.price.text = news.article_price;
    cell.l_rzlx.text = news.article_rzlx;
    cell.goodcontect.text = news.article_title;
    cell.l_date.text = news.article_format_date;
    cell.l_comment.text = news.article_comment;
    cell.l_favorite.text = news.article_favorite;
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [self performSegueWithIdentifier:@"detail" sender:nil];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewsDetailTableViewController *detail = [mainStoryBoard instantiateViewControllerWithIdentifier:@"NewsDetailTableViewController"];
    NewsArticle *news = [[NewsArticle alloc]init];
    news = self.dataArray[indexPath.row];
    detail.model = news;
    [self.navigationController pushViewController:detail animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
