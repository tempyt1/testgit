//
//  News_Details_ViewController.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "News_Details_ViewController.h"
#import "NewsBLL.h"

#import "MBProgressHUD+Jredu.h"

@interface News_Details_ViewController ()<UIWebViewDelegate>
{
    NSMutableDictionary *dict;
    UILabel *title;
    UIWebView *contentView;
}
@end

@implementation News_Details_ViewController
@synthesize news_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dict=[NSMutableDictionary dictionary];
    title=[[UILabel alloc] initWithFrame:CGRectMake(80, 80, 200, 22)];
    [self.view addSubview:title];
    
    contentView=[[UIWebView alloc] initWithFrame:CGRectMake(10, 120, 300, 300)];
    [contentView setBackgroundColor:[UIColor whiteColor]];
    contentView.delegate=self;
    [self.view addSubview:contentView];
    
    [self loadNewsDetails];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)loadNewsDetails{
    [MBProgressHUD showHUDAddedTo:self.view WithText:@"loading"];
    NewsBLL *news_bll=[NewsBLL new];
    [news_bll getNewsDetailsWithId:self.news_id success:^(id json) {
        
        [dict addEntriesFromDictionary:json];
        
        
        //title.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"title"]];
        title.text=[NSString stringWithFormat:@"%@",[[dict objectForKey:@"body"] objectForKey:@"title"]];

        ;
//        [contentView loadHTMLString:[NSString stringWithFormat:@"%@",[dict objectForKey:@"content"]] baseURL:nil];
        
      
         [contentView loadHTMLString:[NSString stringWithFormat:@"%@",[[dict objectForKey:@"body"]objectForKey:@"text"]] baseURL:nil];
        

        
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        
    } fail:^{
        [MBProgressHUD showAutoHideHUDAddedTo:self.view WithText:@"网络太忙了，请稍候重试" andHideAfter:3];
        
    }];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%'";
//
//    
//    [webView stringByEvaluatingJavaScriptFromString:str];
    //字体大小
    NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize=9"];
    //
    [webView stringByEvaluatingJavaScriptFromString:jsString];
    
    //背景色
       [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];
    //字体颜色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'red'"];
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
