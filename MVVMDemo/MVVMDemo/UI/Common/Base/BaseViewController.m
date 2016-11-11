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

@end