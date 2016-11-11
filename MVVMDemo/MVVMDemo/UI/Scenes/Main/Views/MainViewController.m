//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "Dependences.h"
#import "Storyboards.h"
#import "NavigationsViewController.h"
#import "Navigator.h"

@interface MainViewController ()

@end

@implementation MainViewController

+ (instancetype)mainVC {
    HomeViewController * homeVC = [[Dependences sharedInstance].storyboards.main
                                   instantiateViewControllerWithIdentifier:@"HomeViewController"];
    UINavigationController * centerVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    NavigationsViewController *navigationsVC = [[Dependences sharedInstance].storyboards.main
                                                instantiateViewControllerWithIdentifier:@"NavigationsViewController"];
    
    MainViewController * vc = [[MainViewController alloc] initWithContentViewController:centerVC
                                                                 leftMenuViewController:navigationsVC rightMenuViewController:nil];
    homeVC.navigator = [[Navigator alloc] initWithStoryboard:[Dependences sharedInstance].storyboards.main
                                          navigateController:centerVC];
    homeVC.centerView = vc;
    
    return vc;
}


- (void)showNavigations:(void (^)())completionHandler {
    [self presentLeftMenuViewController];
}


@end
