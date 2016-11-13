//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Navigator;

@interface BaseViewController : UIViewController

@property (nonatomic, strong) Navigator * navigator;

- (void)showloading;
- (void)hideloading;
- (void)showConfirm:(NSString *)message completion:(void(^)(void))completion;

@end