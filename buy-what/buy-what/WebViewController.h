//
//  WebViewController.h
//  buy-what
//
//  Created by 陈行 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(nonatomic,strong) UIWebView * webView;
@property(nonatomic,strong) NSURLRequest *request;
@property(nonatomic,strong) NSString *tag;
@end
