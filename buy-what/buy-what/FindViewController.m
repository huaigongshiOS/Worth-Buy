//
//  FindViewController.m
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "FindViewController.h"
#import "CustomCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "Item.h"
#import "DataRequest.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "ADPics.h"
#import "MJRefresh.h"

static NSString *cellIdentifier = @"cell";

@interface FindViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,DataRequestDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *itemsCollectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *imageArray;
@property (assign,nonatomic) int location;

@end

@implementation FindViewController
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}
-(NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _imageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.location = 1;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];//解析的类型
    
    [manager GET:@"http://api.smzdm.com/v2/util/banner?f=iphone&type=faxian&v=6.0.1&weixin=1" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *d = responseObject[@"data"];
        NSArray *a = d[@"rows"];
        for (NSDictionary *dic in a) {
            ADPics *p = [[ADPics alloc] initWithDic:dic];
            [self.imageArray addObject:p];
        }
        [self.itemsCollectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    
    
    
    self.itemsCollectionView.backgroundColor = [UIColor grayColor];
    
    [self.itemsCollectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.itemsCollectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    //
    DataRequest *request = [[DataRequest alloc] init];
    request.delegate = self;
    [request requestData:@"http://api.smzdm.com/v1/faxian/articles?f=iphone&imgmode=0&limit=20&offset=0&v=6.0.1&weixin=1"];
    //    [request requestData:@"http://api.smzdm.com/v2/util/banner?f=iphone&type=faxian&v=6.0.1&weixin=1"];
    
    [self.itemsCollectionView addHeaderWithTarget:self action:@selector(headRefresh)];
    [self.itemsCollectionView addFooterWithTarget:self action:@selector(footRefresh)];
    
    UICollectionViewFlowLayout *flowlayout = (UICollectionViewFlowLayout *)self.itemsCollectionView.collectionViewLayout;
    flowlayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 110);
    // Do any additional setup after loading the view.
}
-(void)headRefresh
{
    [self.dataArray removeAllObjects];
    DataRequest *request = [[DataRequest alloc] init];
    request.delegate = self;
    [request requestData:@"http://api.smzdm.com/v1/faxian/articles?f=iphone&imgmode=0&limit=20&offset=0&v=6.0.1&weixin=1"];
    //    [self.itemsCollectionView reloadData];
    [self.itemsCollectionView headerEndRefreshing];
    
}

-(void)footRefresh
{
    DataRequest *request = [[DataRequest alloc] init];
    request.delegate = self;
    NSString *s = @"http://api.smzdm.com/v1/faxian/articles?article_date&f=iphone&imgmode=0&limit=20&offset=";
    NSString *a = [NSString stringWithFormat:@"%d",self.location *20];
    NSString *s1 = [s stringByAppendingString:a];
    NSString *s2 = [s1 stringByAppendingString:@"&page="];
    self.location++;
    NSString *b = [NSString stringWithFormat:@"%d",self.location];
    NSString *s3 = [s2 stringByAppendingString:b];
    NSString *s4 = [s3 stringByAppendingString:@"&v=6.0.1&weixin=1"];
    [request requestData:s4];
    [self.itemsCollectionView footerEndRefreshing];
}
-(void)passValue:(id)sender
{
    NSDictionary *d = sender[@"data"];
    NSArray *array = d[@"rows"];
    for (NSDictionary *dic in array) {
        Item *item = [[Item alloc] initWithDic:dic];
        [self.dataArray addObject:item];
    }
    [self.itemsCollectionView reloadData];
    
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        headerView.array = [NSArray arrayWithArray:self.imageArray];
        [headerView loadImageView];
        
        return headerView;
    } else return nil;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 5, 5);
    return inset;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake((self.view.frame.size.width - 5) / 2.0 , 260);
    return size;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = [self.dataArray objectAtIndex:indexPath.row];
    //http://api.smzdm.com/v2/youhui/articles/792461?channel_id=2&f=iphone&filtervideo=1&imgmode=0&show_dingyue=1&show_wiki=1&v=6.0.1&weixin=1
    NSString *s = @"http://api.smzdm.com/v2/youhui/articles/";
    NSString *s1 = [s stringByAppendingString:item.article_id];
    NSString *s2 = [s1 stringByAppendingString:@"?channel_id=2&f=iphone&filtervideo=1&imgmode=0&show_dingyue=1&show_wiki=1&v=6.0.1&weixin=1"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];//解析的类型
    
    [manager GET:s2 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *d = responseObject[@"data"];
        NSString *url = d[@"article_link"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        //            [self.itemsCollectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    Item *item = [self.dataArray objectAtIndex:indexPath.row];
    //    cell.itemImageView.image = [UIImage imageNamed:@"1"];
    [cell.itemImageView sd_setImageWithURL:[NSURL URLWithString:item.article_pic] placeholderImage:[UIImage imageNamed:@"1"]];
    cell.nameLabel.text = item.article_title;
    cell.priceLabel.text = item.article_price;
    cell.priceLabel.textColor = [UIColor redColor];
    [cell setString:item.article_mall];
    cell.timeLabel.text = item.article_format_date;
    if (item.article_comment == nil) {
        cell.commentsNumberLabel.text = @"0";
    }else cell.commentsNumberLabel.text = item.article_comment;
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
