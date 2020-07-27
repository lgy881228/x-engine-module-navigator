//
//  __xengine__module_NavigationModule.m
//  AFNetworking
//
//  Created by edz on 2020/7/24.
//

#import "__xengine__module_NavigationModule.h"
#import "XEngineSDK.h"
@implementation __xengine__module_NavigationModule
- (NSString *)moduleId
{
    return @"_navigator";
}

- (void)gotohome:(NSString *)jsonString complate:(XEngineCallBack)completionHandler
{
    NSDictionary *param = [JSONToDictionary toDictionary:jsonString];
    
    NSString *jsonStr = [JSONToDictionary toString:@{}];
    completionHandler(jsonString,YES);
}
@end
    
