//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "NavigationsViewModel.h"
#import "UserService.h"

@interface NavigationsViewModel () {
    NSObject <UserService> * _userService;
}

@end

@implementation NavigationsViewModel

- (instancetype)initWithUserService:(NSObject <UserService> *)userService {
    if (self = [super init]) {
        _userService = userService;
    }

    return self;
}

- (void)logout {
    [_userService signout];
}


@end