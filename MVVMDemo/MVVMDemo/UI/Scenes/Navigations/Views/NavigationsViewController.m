//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "NavigationsViewController.h"
#import "NavigationsViewModel.h"
#import "Dependences.h"

@interface NavigationsViewController ()

@property (nonatomic, strong) NavigationsViewModel * model;

@end

@implementation NavigationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[NavigationsViewModel alloc] initWithUserService:[Dependences sharedInstance].userService];
}

- (IBAction)signout:(UIButton*)sender {
    [self showConfirm:@"Do you want to sign out ?" completion:^{
        [_model logout];
    }];
}


@end