//
//  XEngineConfigModel.m
//  XEngineSDK
//
//  Created by edz on 2020/7/23.
//

#import "XEngineConfigModel.h"
@implementation ModuelInfoModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"minIOSVersion":@"minimal_os_version.ios"}];
}

@end


@implementation XEngineConfigModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
