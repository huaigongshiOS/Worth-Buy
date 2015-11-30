//
//  WebViewController.m
//  buy-what
//
//  Created by 陈行 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
{

}
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    _webView =[[UIWebView alloc]init];
    _webView.delegate = self;
    _webView.frame = self.view.bounds;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _webView.scalesPageToFit = YES;
    _webView.backgroundColor = [UIColor whiteColor];
    [_webView loadRequest:_request];
    
    [self.view addSubview:_webView];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    _tag =_webView.request.URL.absoluteString;

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

//    NSLog(@"webView location = '%@'",_webView.request.URL.absoluteString);
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.navigationItem.title = theTitle;
    return YES;
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
