//
//  URLTools.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "URLTools.h"
#import "App_Configs.h"

@implementation URLTools
+(NSURL *)imageURLWithPath:(id)image_path{
    NSURL *imageUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BASE_URL,image_path]];
    return imageUrl;
}
@end
