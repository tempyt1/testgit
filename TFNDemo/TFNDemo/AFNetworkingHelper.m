//
//  AFNetworkingHelper.m
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "AFNetworkingHelper.h"
#import "AFNetworking.h"

@implementation AFNetworkingHelper
-(void)getJsonFromURLString:(NSString *)urlString andParmeters:(NSDictionary *)params success:(void(^)(id json))success fail:(void(^)())fail{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval=20;

    
    [manager POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"afn error=%@",error);
        fail();
    }];
    
    
}
@end
