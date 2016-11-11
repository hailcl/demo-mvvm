//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "UserServiceImpl.h"
#import "User.h"
#import "UserRepository.h"
#import "SaveUserParams.h"
#import "LoginParams.h"

@interface UserServiceImpl ()

@property (nonatomic, strong) NSMutableArray <NSObject<UserServiceSubscriber> *> * subscribers;
@property (nonatomic, strong) NSObject <UserRepository> *userRepository;

@end

@implementation UserServiceImpl

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)userRepository {
    if (self = [super init]) {
        _subscribers = [NSMutableArray new];
        _userRepository = userRepository;
    }

    return self;
}

- (void)loginWithParams:(LoginParams *)params complete:(void (^)(LoginError *error))completion {
    SaveUserParams * saveUserParams = [SaveUserParams new];
    saveUserParams.userid = params.username;
    saveUserParams.username = params.username;

    __weak UserServiceImpl *weakSelf = self;
    [_userRepository saveUser:saveUserParams complete:^(User *user) {
        completion ? completion(nil) : nil;
        [weakSelf emitUserLoggedIn:user];
    }];
}

- (void)addSubcriber:(NSObject <UserServiceSubscriber> *)subcriber {
    [_subscribers addObject:subcriber];
}

- (void)emitUserLoggedIn:(User *)user {
    [_subscribers enumerateObjectsUsingBlock:^(NSObject <UserServiceSubscriber> *obj, NSUInteger idx, BOOL *stop) {
        [obj loggedIn:user];
    }];
}

@end
