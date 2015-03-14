//
//  MBProgressHUD+Jredu.m
//  TestAFN
//
//  Created by jerehedu on 15/3/6.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "MBProgressHUD+Jredu.h"

@implementation MBProgressHUD (Jredu)
+ (instancetype)showHUDAddedTo:(UIView *)view WithText:(NSString *)text {
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText=text;
    [hud show:YES];
    return hud;
}

+ (instancetype)showAutoHideHUDAddedTo:(UIView *)view WithText:(NSString *)text andHideAfter:(NSTimeInterval)timeInterval {
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText=text;
    [hud show:YES];
    [hud hide:YES afterDelay:timeInterval];
    return hud;
}
@end
