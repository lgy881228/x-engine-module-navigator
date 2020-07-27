//
//  Unity.h
//  XEngine
//
//  Created by edz on 2020/7/10.
//  Copyright © 2020 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Unity : NSObject
+ (NSString *)getAppKey:(NSString *)appSecret MicroApp:(NSString *)microApp;
+ (Unity *)sharedInstance;
- (UIView *)topView;
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;

+ (NSMutableArray *)getModuleClassName;
@end

NS_ASSUME_NONNULL_END
