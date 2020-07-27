//
//  XEngineConfigModel.h
//  XEngineSDK
//
//  Created by edz on 2020/7/23.
//

#import "JSONModel.h"

@protocol ModuelInfoModel;

@interface ModuelInfoModel : JSONModel
@property (nonatomic, copy) NSString *engine_version;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *module_id;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *minIOSVersion;

@end

@interface XEngineConfigModel : JSONModel
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *offlineServerUrl;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, strong) NSArray <ModuelInfoModel>*moduels;

@end


