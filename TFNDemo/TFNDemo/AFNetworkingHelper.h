//
//  AFNetworkingHelper.h
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import <Foundation/Foundation.h>
//返回值(^)(参数列表)
@interface AFNetworkingHelper : NSObject
-(void)getJsonFromURLString:(NSString *)urlString andParmeters:(NSDictionary *)params success:(void(^)(id json))success fail:(void(^)())fail;
@end
