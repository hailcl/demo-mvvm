//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "BootstrapViewController.h"
#import "MainViewController.h"
#import "BootstrapViewModel.h"
#import "Dependences.h"
#import "SigninViewController.h"
#import "Storyboards.h"
#import "Constants.h"

@interface BootstrapViewController () <BootstrapView>

@property BootstrapViewModel * model;

@end

@implementation BootstrapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[BootstrapViewModel alloc] initWithView:self userService:[Dependences sharedInstance].userService];

    [self customeAppearance];
}

- (void)loggedIn {
    self.viewControllers = @[[MainViewController mainVC]];
}

- (void)loggedOut {
    UIStoryboard * storyboard = [Dependences sharedInstance].storyboards.main;
    SigninViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"SigninViewController"];
    self.viewControllers = @[controller];
}

- (void)customeAppearance {
    [self setNeedsStatusBarAppearanceUpdate];
    [[UINavigationBar appearance] setBarTintColor:[Constants sharedInstance].primaryColor];
    [[UINavigationBar appearance] setTintColor:[Constants sharedInstance].secondaryColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
            NSForegroundColorAttributeName:[Constants sharedInstance].secondaryColor,
            NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Bold" size:18.0f]
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
