//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginError.h"

@class LoginParams;

@protocol UserServiceSubscriber;
@class User;

@protocol UserService <NSObject>

- (void)loginWithParams:(LoginParams *)params complete:(void(^)(LoginError * error))completion;
- (void)addSubcriber:(NSObject <UserServiceSubscriber> *)subcriber;

@end

@protocol UserServiceSubscriber <NSObject>

- (void)loggedIn:(User*)user;

@end
