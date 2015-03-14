//
//  NewsDAL.h
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkingHelper.h"
@interface NewsDAL : AFNetworkingHelper

-(void)getNewsWithCategory:(NSString *)category andPageNumber:(int) pageNumber success:(void(^)(id json))success fail:(void(^)())fail;

-(void)getNewsDetailsWithId:(NSString *)id success:(void(^)(id json))success fail:(void(^)())fail;


@end
