//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"

@interface UserServiceMock : NSObject <UserService>

@property (nonatomic, assign) BOOL calledSignIn;
@property (nonatomic, strong) LoginParams * params;

@end