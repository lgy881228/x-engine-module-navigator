//
//  __xengine__module_BaseModule.m
//  UIModule
//
//  Created by edz on 2020/7/21.
//  Copyright © 2020 edz. All rights reserved.
//

#import "xengine__module_BaseModule.h"

@implementation xengine__module_BaseModule
//- (NSArray *)registModules:(DWKWebView *)webView
//{
//    [self findModulesClass:webView];
//    return nil;
//}



- (NSString *)moduleId
{
    return @"";
}

//- (NSArray *)findModulesClass:(DWKWebView *)webView
//{
//       int numClasses;
//       Class * classes = NULL;
//       CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
//       CFAbsoluteTime end2 = CFAbsoluteTimeGetCurrent();
//       NSLog(@"time2 cost: %0.3f", end2 - start);
//       NSMutableArray *classNameArray = [NSMutableArray array];
//       //1.获取当前app运行时所有的类，包括系统创建的类和开发者创建的类的  个数
//       numClasses = objc_getClassList(NULL, 0);
//       
//       if (numClasses > 0 )
//       {
//           //2.创建一个可以容纳numClasses个的大小空间
//           classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
//
//           //3.重新获取具体类的列表和个数
//           numClasses = objc_getClassList(classes, numClasses);
//           
//           //4.遍历
//           for (int i = 0; i < numClasses; i++) {
//               Class class = classes[i];
//               const char *className = class_getName(class);
//               NSString *claseeNameString = [[NSString alloc] initWithCString:className encoding:NSUTF8StringEncoding];
////              NSString *className = NSStringFromClass(class);
//               //根据类名调用
//               if (startsWith( "__xengine__module_",className) )
//               {
//                   xengine__module_BaseModule* module = [[class alloc] init];
//
////               NSLog(@"class name2 = %s", className);
////                   NSLog(@"class moduleId = %@", my.moduleId);
////
//                   [webView addJavascriptObject:[[class alloc] init] namespace:module.moduleId];
//                [classNameArray addObject:claseeNameString];
//               }
//           }
//           free(classes);
//       }
//       // do something
//          CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
//          NSLog(@"time2 cost: %0.3f", end - start);
//    return nil;
//}

//bool startsWith(const char *pre, const char *str)
//{
//    size_t lenpre = strlen(pre),
//           lenstr = strlen(str);
//    return lenstr < lenpre ? false : memcmp(pre, str, lenpre) == 0;
//}
@end
