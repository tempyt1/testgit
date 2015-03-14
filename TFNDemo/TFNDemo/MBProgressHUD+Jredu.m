//
//  MBProgressHUD+Jredu.m
//  TFNDemo
//
//  Created by jerehedu on 15/3/9.
//  Copyright (c) 2015年 jereh. All rights reserved.
//

#import "MBProgressHUD+Jredu.h"

@implementation MBProgressHUD (Jredu)
+(instancetype)showHUDAddedTo:(UIView *)view Text:(NSString *)text{
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    MBProgressHUD *hud=[[MBProgressHUD alloc]initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText=text;
    [hud show:YES];
    return hud;
}

+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text afterDelay:(NSTimeInterval)timeInterval{
   [MBProgressHUD hideAllHUDsForView:view animated:NO];
   MBProgressHUD *hud=[[MBProgressHUD alloc]initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText=text;
    [hud show:YES];
    [hud hide:YES afterDelay:timeInterval];
    return hud;
}
+(instancetype)showAutoHideHUDAddedTo:(UIView *)view Text:(NSString *)text{
    return [self showAutoHideHUDAddedTo:view Text:text afterDelay:3];
}
@end
