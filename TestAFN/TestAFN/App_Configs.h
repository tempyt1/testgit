//
//  App_Configs.h
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#ifndef TestAFN_App_Configs_h
#define TestAFN_App_Configs_h


#endif

#define BASE_URL @"http://localhost"
#define DEFAULT_IMAGE_URL @"default.jpg"

#define DEFAULT_IMAGE [UIImage imageNamed:DEFAULT_IMAGE_URL]

#define IMAGE_URL(path) [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",BASE_URL,path)

