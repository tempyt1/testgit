//
//  NewsBLL.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "NewsBLL.h"
#import "NewsDAL.h"
@implementation NewsBLL
-(void)getNewsWithCategory:(NSString *)category andPageNumber:(int) pageNumber success:(void(^)(id json))success fail:(void(^)())fail{
    NewsDAL *newDAL=[NewsDAL new];
    [newDAL getNewsWithCategory:category andPageNumber:pageNumber success:success fail:fail];
}
-(void)getNewsDetailsWithId:(NSString *)id success:(void(^)(id json))success fail:(void(^)())fail{
    NewsDAL *newDAL=[NewsDAL new];
    [newDAL getNewsDetailsWithId:id success:success fail:fail];
}
@end
