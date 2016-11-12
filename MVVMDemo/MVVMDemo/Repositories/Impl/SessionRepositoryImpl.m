//
// Created by Nguyen Thanh Hai on 11/12/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "SessionRepositoryImpl.h"
#import "User.h"
#import "UserRepository.h"

#define kUserId @"kUserId"

@interface SessionRepositoryImpl () {
    NSUserDefaults * _userDefaults;
    NSObject <UserRepository>* _userRepository;
}

@end


@implementation SessionRepositoryImpl

- (instancetype)initWithUserRepository:(NSObject <UserRepository>*)userRepository {
    if (self = [super init]) {
        _userRepository = userRepository;
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

- (User *)currentUser {
    User * user = nil;
    NSString * userid = [_userDefaults objectForKey:kUserId];
    if (userid) {
        user = [_userRepository getUserById:userid];
    }

    return user;
}

- (void)storeSession:(User *)user {
    [_userDefaults setObject:user.username forKey:kUserId];
    [_userDefaults synchronize];
}

- (void)clear {
    [_userDefaults removeObjectForKey:kUserId];
    [_userDefaults synchronize];
}


@end