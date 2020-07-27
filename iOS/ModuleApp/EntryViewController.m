//
//  EntryViewController.m
//  ModuleApp
//
//  Created by edz on 2020/7/22.
//  Copyright © 2020 edz. All rights reserved.
//

#import "EntryViewController.h"
#import <XEngine.h>
@interface EntryViewController ()

@end

@implementation EntryViewController
- (IBAction)Action:(id)sender {
    
  
          RecyleWebViewController *webLaderVC = [[RecyleWebViewController alloc] initWithMicroAppId:@"com.zkty.module.uidemo" microAppVersion:@"0" index:0];
      //    webLaderVC.filePath = [NSString stringWithFormat:@"%@/%@.%@",[NSObject microAppDirectory], model.microAppId,model.microAppVersion];
          [self pushViewController:webLaderVC];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
