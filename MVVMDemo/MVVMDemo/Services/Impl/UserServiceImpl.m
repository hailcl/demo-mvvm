//
// Created by Nguyen Thanh Hai on 11/8/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "UserServiceImpl.h"
#import "User.h"
#import "UserRepository.h"
#import "SaveUserParams.h"
#import "LoginParams.h"
#import "SessionRepository.h"

@interface UserServiceImpl () {
    User * _currentUser;
}

@property (nonatomic, strong) NSMutableArray <NSObject<UserServiceSubscriber> *> * subscribers;
@property (nonatomic, strong) NSObject <UserRepository> *userRepository;
@property (nonatomic, strong) NSObject <SessionRepository> *sessionRespository;

@end

@implementation UserServiceImpl

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)userRepository
                     sessionRepositoty:(NSObject <SessionRepository> *)sessionRespository {
    if (self = [super init]) {
        _subscribers = [NSMutableArray new];
        _userRepository = userRepository;
        _sessionRespository = sessionRespository;
        _currentUser = [_sessionRespository currentUser];
    }

    return self;
}

- (User *)currentUser {
    return _currentUser;
}

- (void)loginWithParams:(LoginParams *)params complete:(void (^)(LoginError *error))completion {
    SaveUserParams * saveUserParams = [SaveUserParams new];
    saveUserParams.userid = params.username;
    saveUserParams.username = params.username;

    __weak UserServiceImpl *weakSelf = self;
    [_userRepository saveUser:saveUserParams complete:^(User *user) {
        completion ? completion(nil) : nil;
        _currentUser = user;
        [_sessionRespository storeSession:user];
        [weakSelf emitUserLoggedIn:user];
    }];
}

- (void)signout {
    [_sessionRespository clear];
    _currentUser = nil;
    [_subscribers enumerateObjectsUsingBlock:^(NSObject <UserServiceSubscriber> *obj, NSUInteger idx, BOOL *stop) {
        [obj loggedOut];
    }];
}


- (void)addSubcriber:(NSObject <UserServiceSubscriber> *)subcriber {
    [_subscribers addObject:subcriber];
    if (_currentUser) {
        [subcriber loggedIn:_currentUser];
    }
}

- (void)emitUserLoggedIn:(User *)user {
    [_subscribers enumerateObjectsUsingBlock:^(NSObject <UserServiceSubscriber> *obj, NSUInteger idx, BOOL *stop) {
        [obj loggedIn:user];
    }];
}

@end
