//
//  XEngineSDK.h
//  XEngine
//
//  Created by 李国阳 on 2020/7/13.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XEngine.h"
@interface XEngineSDK : NSObject

@property (strong, nonatomic) NSMutableArray *moduleClassNames;
@property (strong, nonatomic) NSDictionary *launchOptions;
@property (strong, nonatomic) UIApplication *application;
+ (instancetype)sharedInstance;
- (void) registerWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


- (void)loadMicroApp;
@end

