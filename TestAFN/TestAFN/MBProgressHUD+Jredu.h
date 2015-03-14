//
//  MBProgressHUD+Jredu.h
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Jredu)
+ (instancetype)showHUDAddedTo:(UIView *)view WithText:(NSString *)text;
+ (instancetype)showAutoHideHUDAddedTo:(UIView *)view WithText:(NSString *)text andHideAfter:(NSTimeInterval)timeInterval;
@end
