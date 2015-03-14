//
//  ViewController.m
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "ViewController.h"
#import "NewsBLL.h"
#import "MBProgressHUD+Jredu.h"
#import "App_Confing.h"
#import "UIImageView+WebCache.h"
#import "News_Details_ViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    @private
    UITableView *table;
    NSMutableArray *tableSource;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 50, 300, 500)];
    table.dataSource=self;
    table.delegate=self;
    [self.view addSubview:table];
    tableSource=[NSMutableArray array];
    
    [self loadNetNewsData];

}
-(void)loadNetNewsData{
    NewsBLL *newsBLL=[NewsBLL new];

    [MBProgressHUD showHUDAddedTo:self.view Text:@"loading"];
    
    [newsBLL getNewsListWithChannel:@"headerline" PageNumber:1 success:^(id json) {
        [tableSource addObjectsFromArray:json];
        [table reloadData];
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } fail:^{
        [MBProgressHUD showAutoHideHUDAddedTo:self.view Text:@"网络繁忙，请稍候重试"];
   
    }];
}



#pragma mark tabeldelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableSource count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellReuseFlag=@"cell";
    UITableViewCell *cell=[table dequeueReusableCellWithIdentifier:cellReuseFlag];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseFlag];
        
    }
    //[{"title":"success","image":"logo.gif","id":1}]
    cell.textLabel.text=[[tableSource objectAtIndex:indexPath.row] objectForKey:@"title"];

    NSURL *imageUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BASE_URL,[[tableSource objectAtIndex:indexPath.row] objectForKey:@"image"]]];
    
    [cell.imageView sd_setImageWithURL:imageUrl
                      placeholderImage:DEFAULT_IMAGE];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *news_id=[NSString stringWithFormat:@"%@",[[tableSource objectAtIndex:indexPath.row] objectForKey:@"id"]];
    
    News_Details_ViewController *details=[[News_Details_ViewController alloc]initWithNibName:@"News_Details_ViewController" bundle:nil];
    details.news_id=news_id;
    
    [self.navigationController pushViewController:details animated:YES];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
