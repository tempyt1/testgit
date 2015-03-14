//
//  AFNetworkingHelper.h
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetworkingHelper : NSObject


//回传值(^名字)(参数列);
-(void) getJsonDataFromUrl:(NSString *) url andParam:(NSDictionary *)params success:(void(^)(id json))success faile:(void(^)())fail;


@end
