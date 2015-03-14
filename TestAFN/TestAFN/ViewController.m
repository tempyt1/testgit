//
//  ViewController.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "ViewController.h"
#import "NewsBLL.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "App_Configs.h"
#import "URLTools.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Jredu.h"
#import "News_Details_ViewController.h"
#import "PullTableView.h"

#import "AFNetworking.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>{
    UITableView *table;
    NSMutableArray *array;
    
    PullTableView *p_table;
    int pageNumber;
    
    int angle;
    UIImageView *view;
    BOOL isStart;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isStart=NO;
    angle=0;
    
    
    NSLog(@".....+++++++++..");
    pageNumber=1;

    
    
//    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
//    table.delegate=self;
//    table.dataSource=self;
//    
//    [self.view addSubview:table];
    
    array=[NSMutableArray array];
    
    //[self LoadDataFromNetWithPageNumber:pageNumber];

    
    
//    p_table=[[PullTableView alloc]initWithFrame:CGRectMake(0, 200, 350, 320)];
//    p_table.pullDelegate=self;
//    p_table.dataSource=self;
//    p_table.pullBackgroundColor=[UIColor grayColor];
//    p_table.pullArrowImage=[UIImage imageNamed:@"default.jpg"];
//    
//    
//    [self.view addSubview:p_table];
    
    
    [self batchRequest];
    
//    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 50, 150, 20)];
//
//    btn.titleLabel.text=@"roate";
//    [btn addTarget:self action:@selector(startAnim) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn];
    
    
   
}

-(void)startAnim{

  
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.01];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    view.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endAnimation
{
    angle += 10;
    if(view){
        [self startAnim];
    }
}

-(void)batchRequest{
    NSMutableArray *mutableOperations = [NSMutableArray array];
    NSURLRequest *request1 = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:@"http://api.3g.ifeng.com/iosNews?id=aid=SYDT10&imgwidth=100&type=list&pagesize=20" parameters:nil error:nil];
    
    NSURLRequest *request2 = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:@"http://api.3g.ifeng.com/iosNews?id=aid=SYLB10,SYDT10&imgwidth=100&type=list&pagesize=20&pageindex=1" parameters:nil error:nil];
    
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc] initWithRequest:request1];
    operation1.responseSerializer=[AFJSONResponseSerializer serializer];
    AFHTTPRequestOperation *operation2 = [[AFHTTPRequestOperation alloc] initWithRequest:request2];
    operation2.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [mutableOperations addObject:operation1];
    [mutableOperations addObject:operation2];
        
    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        
        NSLog(@"%lu of %lu complete", numberOfFinishedOperations, totalNumberOfOperations);
        
    } completionBlock:^(NSArray *operations) {
        
        NSLog(@"%@",operation1.error);
//        
//        for(AFHTTPRequestOperation *operation in operations){
//            //            [NSJSONSerialization JSONObjectWithData:operation.responseData options:kNilOptions error:nil];
//            NSLog(@"%@",[operation.responseObject class]);
//            NSLog(@"%@",operation.responseObject);
//            
////            NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:operation.responseData options:kNilOptions error:nil]);
//        }
//        
        NSLog(@"All operations in batch complete");
        
        //NSLog(@"%@",[operation2.responseObject class]);
        
    }];
    
    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
}


-(void)LoadDataFromNetWithPageNumber:(int)page_Number{
    
    [MBProgressHUD showHUDAddedTo:self.view WithText:@"loading"];
 
      NewsBLL *newBll=[NewsBLL new];
    
        [newBll getNewsWithCategory:@"headerline" andPageNumber:page_Number success:^(id json) {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [array addObjectsFromArray:json];
            [table reloadData];
            [p_table reloadData];
            
        } fail:^{
//            MBProgressHUD *hud=[MBProgressHUD HUDForView:self.view];
//            hud.labelText=@"fail";
//            [hud show:YES];
//            [hud hide:YES afterDelay:3];
            
            [MBProgressHUD showAutoHideHUDAddedTo:self.view WithText:@"fail" andHideAfter:3];
            NSLog(@"faile");
            
        }];
    

  
  }




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[table dequeueReusableCellWithIdentifier:@"cell"];
   
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[array[indexPath.row] objectForKey:@"title"];
//    cell.imageView.image=DEFAULT_IMAGE;
    
    NSURL *imageUrl=[URLTools imageURLWithPath:[array[indexPath.row] objectForKey:@"image"]];
  
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:DEFAULT_IMAGE];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString  *new_id=[NSString stringWithFormat:@"%@",[array[indexPath.row] objectForKey:@"id"]];
    NSLog(@"%@",new_id);
    
    News_Details_ViewController *new_details=[[News_Details_ViewController alloc]initWithNibName:@"News_Details_ViewController" bundle:nil];
    new_details.news_id=new_id;
    [self.navigationController pushViewController:new_details animated:YES];
    
}

//下拉刷新
-(void)refreshTable{
    [array removeAllObjects];
    pageNumber=1;
    [self LoadDataFromNetWithPageNumber:pageNumber];
    
    p_table.pullLastRefreshDate=[NSDate date];
    
    p_table.pullTableIsRefreshing=NO;
    
    
    
}
//上拉加载更多
-(void)loadMoreData{
    pageNumber++;
    [self LoadDataFromNetWithPageNumber:pageNumber];
    
    p_table.pullTableIsLoadingMore=NO;
}




#pragma mark pullTable
- (void)pullTableViewDidTriggerRefresh:(PullTableView*)pullTableView{
    
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:3.0];
}
- (void)pullTableViewDidTriggerLoadMore:(PullTableView*)pullTableView{
    [self performSelector:@selector(loadMoreData) withObject:nil afterDelay:3];
    
}

- (IBAction)btnClick:(id)sender {
    if(!view){
        view=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"default.jpg"]];
        [view setFrame:CGRectMake(50, 500, 100, 50)];
        [self.view addSubview:view];
    }
    angle=0;
    if(!isStart){
        [self startAnim];
        isStart=YES;
    }
    
}

- (IBAction)stopAnim:(id)sender {
    [view removeFromSuperview];
    view=nil;
    isStart=NO;
    
}
@end
