//
//  XEngineCallInfo.h
//  XEngineSDK
//
//  Created by edz on 2020/7/23.
//

#import <Foundation/Foundation.h>



@interface XEngineCallInfo : NSObject
@property (nullable, nonatomic) NSString* method;
@property (nullable, nonatomic) NSNumber* id;
@property (nullable,nonatomic) NSArray * args;
@end


