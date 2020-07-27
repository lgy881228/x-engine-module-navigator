//
//  SingleQueue.m
//  dsbridgedemo
//
//  Created by Chenwuzheng on 2020/7/10.
//  Copyright © 2020 杜文. All rights reserved.
//

#import "WebViewPool.h"
#import "XEngineWebView.h"
#import "XEngineJSBUtil.h"
#import "PoolingList.h"
#import "Stack.h"
#import <pthread.h>
#import "xengine__module_BaseModule.h"
#import "XEngine.h"
@interface WebViewPool ()
@property (nonatomic, strong) dispatch_queue_t myQueue;
@property (nonatomic, strong) Stack* stack;
@property (nonatomic, strong) NSMutableArray* modules;
@property (nonatomic, strong) PoolingList* cirleList;
@property (nonatomic, assign) pthread_mutex_t mutex;
@end


@implementation WebViewPool
 
 
+ (WebViewPool *)SingleWebViewPool {
    static WebViewPool *_instance;
    @synchronized (self) {
        if(!_instance) {
            _instance = [[WebViewPool alloc] init];
          
        }
        return _instance;
    }
}
- (void) initMoudles{
    XEngineSDK *xengine = [XEngineSDK sharedInstance];

      for (NSString *moduleName in xengine.moduleClassNames)
      {
         xengine__module_BaseModule *moduleClass = [[NSClassFromString(moduleName) alloc] init];
          [self.modules addObject:moduleClass];
            NSLog(@"%@",moduleClass.moduleId);
      }
}
- (instancetype)init{
    _cirleList =[[PoolingList alloc] init];
    _stack = [[Stack alloc] init];
    self.modules = [NSMutableArray array];
    [self initMoudles];
    pthread_mutex_init(&_mutex, NULL);
  
    _myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
     dispatch_sync(_myQueue,^{
            [self expandWebViewsBy:3];
        });
    return self;
}

-(void) expandWebViewsBy:(int) size
{
    for (int i =0 ; i<size; i++)
    {
        XEngineWebView* webView = [[XEngineWebView alloc] init];
        webView.index = i;
        for (xengine__module_BaseModule *baseModule in self.modules)
        {
             [webView addJavascriptObject:baseModule namespace:baseModule.moduleId];
        }
       
        [_cirleList add:webView];
    }
}
- (id)  getUnusedWebViewFromPool{
    pthread_mutex_lock(&_mutex);
    pthread_mutex_unlock(&_mutex);
    
    id newone = [_cirleList  peekCurrent];
    [_cirleList forward];
    // 只剩 1 个缓冲了,加 3 个.
    if([_cirleList getCount] - [ _cirleList getCurrentInex]<2  ){
        NSLog(@"expand circle list......................... ");
         dispatch_sync(_myQueue,^{
             pthread_mutex_lock(&_mutex);
             [self expandWebViewsBy:3];
             pthread_mutex_unlock(&_mutex);
         });
    }
  
    return newone;
}
- (void)  putbackWebViewIntoPool{
    pthread_mutex_lock(&_mutex);
    pthread_mutex_unlock(&_mutex);
     [_cirleList backward];
    
    // 未使用的缓冲超过了 5 个, 且超过 3 次都超过 5 个缓冲, 将缓冲置为 current+3 个
    if([_cirleList getCount] - [ _cirleList getCurrentInex]>5  ){
        pthread_mutex_lock(&_mutex);
        NSLog(@"shrink circle list......................... ");
        [_cirleList shrinkToSize:[_cirleList getCurrentInex]+3];
        pthread_mutex_unlock(&_mutex);
    }
   

}
- (void)debugInfo{
    [_cirleList debugInfo];
    [_stack debugInfo];
}
 
@end
