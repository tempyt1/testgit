//
//  NewsDAL.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//
//[{"title":"ttt","image":"a.png"}]
//BaseUrl="http://localhost/"
//[dict objectForKey:@"image"]  //a.png
//imageUrl=baseUrl+"image/"+"a.png"
//imageView setImageWithUrlString:imageUrl andDefaultImage:

#import "NewsDAL.h"
#import "App_Configs.h"
@implementation NewsDAL

-(void)getNewsWithCategory:(NSString *)category andPageNumber:(int) pageNumber success:(void(^)(id json))success fail:(void(^)())fail{
    
    NSString *url=[NSString stringWithFormat:@"%@/news3.php?category=%@&pageNumber=%i",BASE_URL,category,pageNumber];
    

    NSDictionary *dict=[[NSDictionary alloc] initWithObjectsAndKeys:category,@"category",[NSNumber numberWithInt:pageNumber],@"pageNumber",@"1",@"channel_id",nil];
    
    
    [super getJsonDataFromUrl:url andParam:dict success:success faile:fail];
    
    
}
-(void)getNewsDetailsWithId:(NSString *)id success:(void(^)(id json))success fail:(void(^)())fail{
    // NSString *url=[NSString stringWithFormat:@"%@/news_details.php?news_id=%@",BASE_URL,id];
    
    NSString *url=@"http://api.iclient.ifeng.com/ipadtestdoc?aid=96737788&channel=%E6%96%B0%E9%97%BB";
    NSDictionary *dict=[[NSDictionary alloc] initWithObjectsAndKeys:id, @"news_id",nil];
    [super getJsonDataFromUrl:url andParam:dict success:success faile:fail];
}
@end
