//
//  __xengine__module_UIModule.m
//  UIModule
//
//  Created by edz on 2020/7/21.
//  Copyright © 2020 edz. All rights reserved.
//

#import "__xengine__module_UIModule.h"
#import "XEngine.h"
@implementation __xengine__module_UIModule
#pragma mark - HUD

- (instancetype)init
{
    self = [super init];
    NSLog(@"qwerty");
    return self;
}

- (NSString *)moduleId
{
    return @"_ui";
}
- (void)showSuccessToast:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    
    NSTimeInterval time = 2;
    if (param)
    {
        NSString *duration =[NSString stringWithFormat:@"%@",param[@"duration"]];
        NSString *title = param[@"title"];
        if (duration.doubleValue != 0.0 && ![duration isEqualToString:@""])
         {
             time = duration.floatValue / 1000.0;
         }
        [MBProgressHUD showToastWithTitle:title image:[UIImage imageNamed:@"thcket_success"] time:time];
    }else
    {
        [[Unity sharedInstance].getCurrentVC showLoading];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
            [[Unity sharedInstance].getCurrentVC hideLoading];
            
        });
    }
   
}

- (void)showFailToast:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
  
    NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    
   NSTimeInterval time = 2;
    if (param)
    {
        NSString *duration =[NSString stringWithFormat:@"%@",param[@"duration"]];
        NSString *title = param[@"title"];
        if (duration.doubleValue != 0.0 && ![duration isEqualToString:@""])
         {
             time = duration.floatValue / 1000.0;
         }
        [MBProgressHUD showToastWithTitle:title image:[UIImage imageNamed:@"Ticket_fail"] time:time];
    }else
    {
        [[Unity sharedInstance].getCurrentVC showLoading];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
            [[Unity sharedInstance].getCurrentVC hideLoading];
            
        });
    }
   
}

- (void)showToast:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    
     NSTimeInterval time = 2;
       if (param)
       {
           NSString *duration =[NSString stringWithFormat:@"%@",param[@"duration"]];
           NSString *title = param[@"title"];
           if (duration.doubleValue != 0.0 && ![duration isEqualToString:@""])
            {
                time = duration.floatValue / 1000.0;
            }
           [MBProgressHUD showToastWithTitle:title image:nil time:time];
       }else
       {
        [[Unity sharedInstance].getCurrentVC showLoading];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
            [[Unity sharedInstance].getCurrentVC hideLoading];
            
        });
    }
}

- (void)hiddenToast:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    [[Unity sharedInstance].getCurrentVC hideLoading];
    [self hiddenHudToast:[Unity sharedInstance].topView];
}
- (void)hiddenHudToast:(UIView *)view
{
    [[Unity sharedInstance].getCurrentVC hideLoading];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

- (void)showLoading:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    [[Unity sharedInstance].getCurrentVC showLoading];
}

- (void)hiddenLoading:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    [[Unity sharedInstance].getCurrentVC hideLoading];
}

#pragma mark - Alert
- (void)showModal:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    
    NSString *title = param[@"title"];
    NSString *message = param[@"content"];
    BOOL showCancel =[param[@"showCancel"] boolValue];
    if (showCancel)
    {
        [[Unity sharedInstance].getCurrentVC showAlertWithTitle:title message:message cancelTitle:@"取消" sureTitle:@"确定" cancelHandler:^(UIAlertAction * _Nonnull action) {
             completionHandler(@"0",YES);
        } sureHandler:^(UIAlertAction * _Nonnull action) {
            completionHandler(@"1",YES);
        }];
    }else
    {
        [[Unity sharedInstance].getCurrentVC showAlertWithTitle:title message:message sureTitle:@"确定" sureHandler:^(UIAlertAction * _Nonnull action) {
             completionHandler(@"1",YES);
        }];
    }
   
}


- (void)showActionSheet:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
     NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    NSString *title = param[@"title"];
    NSString *message = param[@"content"];
     NSArray *itemList = param[@"itemList"];
    NSMutableArray *actionHandlers = [NSMutableArray array];
    for (int i = 0; i < itemList.count; i++)
    {
        ActionHandler handler = ^(UIAlertAction * _Nonnull action){
            NSLog(@"%d",i);
        };
        [actionHandlers addObject:handler];
    }
    
    [[Unity sharedInstance].getCurrentVC showActionSheetWithTitle:title message:message cancelTitle:@"取消" sureTitles:itemList cancelHandler:^(UIAlertAction * _Nonnull action) {
        
    } sureHandlers:actionHandlers];
}
@end
