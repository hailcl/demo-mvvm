//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "BootstrapViewModel.h"
#import "UserService.h"

@interface BootstrapViewModel () <UserServiceSubscriber>

@property (nonatomic, weak) NSObject <BootstrapView> * view;
@property (nonatomic, weak) NSObject <UserService> * userService;

@end

@implementation BootstrapViewModel

- (id)initWithView:(NSObject <BootstrapView> *)view userService:(NSObject <UserService> *)service {
    if (self = [super init]) {
        _view = view;
        _userService = service;
        [_userService addSubcriber:self];
    }

    return self;
}

- (void)loggedIn:(User *)user {
    [_view loggedIn];
}

- (void)loggedOut {
    [_view loggedOut];
}

@end