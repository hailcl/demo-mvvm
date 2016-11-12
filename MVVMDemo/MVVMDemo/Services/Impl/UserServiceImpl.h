//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"

@protocol UserRepository;
@protocol SessionRepository;

@interface UserServiceImpl : NSObject <UserService>

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)userRepository
                     sessionRepositoty:(NSObject <SessionRepository> *)sessionRespository;

@end