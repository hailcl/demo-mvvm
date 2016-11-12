//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionRepository.h"

@protocol UserRepository;

@interface SessionRepositoryImpl : NSObject <SessionRepository>

- (instancetype)initWithUserRepository:(NSObject <UserRepository>*)userRepository;

@end