//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "BaseViewController.h"
#import "SigninViewModel.h"
#import "Navigator.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Setup Progress View
    [self setupLoadingView];
}

- (void)setupLoadingView {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

- (void)showloading {
    [SVProgressHUD show];
}

- (void)hideloading {
    [SVProgressHUD dismissWithDelay:1.0f];
}

- (void)showConfirm:(NSString *)message completion:(void(^)(void))completion {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"MVVM"
                                                                              message:message
                                                                       preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action) {
                                                          completion ? completion() : nil;
                                                      }];

    [alertController addAction:cancelAction];
    [alertController addAction:okAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

@end