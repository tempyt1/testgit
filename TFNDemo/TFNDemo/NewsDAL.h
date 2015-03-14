//
//  NewsDAL.h
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkingHelper.h"
@interface NewsDAL : AFNetworkingHelper

-(void)getNewsListWithChannel:(NSString *) channel PageNumber:(int)pageNumber success:(void(^)(id json))success fail:(void(^)())fail;



@end
