//
//  HeaderCollectionReusableView.h
//  buy-what
//
//  Created by 钟楚萌 on 15/11/30.
//  Copyright © 2015年 钟楚萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderCollectionReusableView : UICollectionReusableView
@property (assign,nonatomic) int location;
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) NSArray *array;
@property (assign,nonatomic) BOOL flag;
-(void)loadImageView;

@end
