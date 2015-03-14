//
//  NewsBLL.m
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "NewsBLL.h"
#import "NewsDAL.h"
@implementation NewsBLL

-(void)getNewsListWithChannel:(NSString *) channel PageNumber:(int)pageNumber success:(void(^)(id json))success fail:(void(^)())fail{
    NewsDAL *newsDAL=[NewsDAL new];
    [newsDAL getNewsListWithChannel:channel PageNumber:pageNumber success:success fail:fail];
}

@end
