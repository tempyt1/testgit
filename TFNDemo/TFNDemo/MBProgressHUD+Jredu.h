//
//  MBProgressHUD+Jredu.h
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Jredu)
+(instancetype)showHUDAddedTo:(UIView *)view Text:(NSString *)text;
+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text afterDelay:(NSTimeInterval)timeInterval;
+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text;
@end
