//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BootstrapView;
@protocol UserService;

@interface BootstrapViewModel : NSObject

- (id)initWithView:(NSObject <BootstrapView> *)view userService:(NSObject <UserService> *)service;

@end

@protocol BootstrapView <NSObject>

- (void)loggedIn;
- (void)loggedOut;

@end