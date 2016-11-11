//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserRepository.h"

@protocol RealmUserRepository;

@interface UserRepositoryImpl : NSObject <UserRepository>

- (instancetype)initWithRealmUserRepository:(NSObject <RealmUserRepository> *)realmUserRepository;

@end