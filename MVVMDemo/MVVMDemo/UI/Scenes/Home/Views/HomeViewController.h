//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "BaseViewController.h"

@protocol CenterView;

@interface HomeViewController : BaseViewController

@property (nonatomic, weak) NSObject <CenterView> * centerView;

@end