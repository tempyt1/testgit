//
//  AFNetworkingHelper.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "AFNetworkingHelper.h"
#import "AFNetworking.h"
@implementation AFNetworkingHelper


-(void) getJsonDataFromUrl:(NSString *) url andParam:(NSDictionary *)params success:(void(^)(id json))success faile:(void(^)())fail{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(success){
            
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"AfN_error=%@",error);
        if(fail){
            fail();
        }
    }];
}
@end
