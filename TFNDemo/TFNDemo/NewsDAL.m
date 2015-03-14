//
//  NewsDAL.m
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "NewsDAL.h"
#import "App_Confing.h"

@implementation NewsDAL
-(void)getNewsListWithChannel:(NSString *) channel PageNumber:(int)pageNumber success:(void(^)(id json))success fail:(void(^)())fail{
    
    NSString *url=[NSString stringWithFormat:@"%@/news.php",BASE_URL];
    NSDictionary *params=[[NSDictionary alloc] initWithObjectsAndKeys:channel,@"category",[NSNumber numberWithInt:pageNumber],@"pageNumber", nil];
    NSLog(@"%@",params);
    
    [super getJsonFromURLString:url andParmeters:params success:success fail:fail];
}
@end
