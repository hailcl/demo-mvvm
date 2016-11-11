//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "Dependences.h"
#import "Storyboards.h"
#import "UserService.h"
#import "UserServiceImpl.h"
#import "UserRepositoryImpl.h"
#import "RealmUserRepositoryImpl.h"
#import "RealmFactory.h"
#import "Configurations.h"
#import "APIClient.h"
#import "VenueService.h"
#import "VenueServiceImpl.h"
#import "VenueAPICLient.h"
#import "VenueRepositoryImpl.h"
#import "RealmVenueRepository.h"
#import "RealmVenueRepositoryImpl.h"

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface Dependences ()

@property (nonatomic, strong) NSObject <UserRepository> * userRepository;
@property (nonatomic, strong) NSObject <RealmUserRepository> * realmUserRepository;
@property (nonatomic, strong) RealmFactory * realmFactory;
@property (nonatomic, strong) APIClient * apiClient;
@property (nonatomic, strong) NSObject <VenueAPI> *venueAPI;
@property (nonatomic, strong) NSObject <VenueRepository> *venueRepository;
@property (nonatomic, strong) NSObject <RealmVenueRepository> * realmVenueRepository;
@end

@implementation Dependences

+ (instancetype)sharedInstance {
    static Dependences *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Dependences alloc] init];
    });

    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory

        DDLogVerbose(@"Application Document Directory : %@", documentsDirectory);
    }

    return self;
}

- (Configurations *)configurations {
    if (_configurations == nil) {
        _configurations = [Configurations new];
    }

    return _configurations;
}

- (Storyboards *)storyboards {
    if (_storyboards == nil) {
        _storyboards = [Storyboards new];
    }

    return _storyboards;
}

- (RealmFactory *)realmFactory {
    if (_realmFactory == nil) {
        _realmFactory = [RealmFactory new];
    }

    return _realmFactory;
}

- (NSObject <RealmUserRepository> *)realmUserRepository {
    if (_realmUserRepository == nil) {
        _realmUserRepository = [[RealmUserRepositoryImpl alloc] initWithFactory:self.realmFactory];
    }

    return _realmUserRepository;
}

- (NSObject <UserRepository> * )userRepository {
    if (_userRepository == nil) {
        _userRepository = [[UserRepositoryImpl alloc] initWithRealmUserRepository:self.realmUserRepository];
    }

    return _userRepository;
}

- (NSObject<UserService> *)userService {
    if (_userService == nil) {
        _userService = [[UserServiceImpl alloc] initWithUserRepository:self.userRepository];
    }

    return _userService;
}

- (APIClient *)apiClient {
    if (_apiClient == nil) {
        _apiClient = [[APIClient alloc] initWithConfiguration:self.configurations];
    }

    return _apiClient;
}

- (NSObject <VenueAPI> *)venueAPI {
    if (_venueAPI == nil) {
        _venueAPI = [[VenueAPICLient alloc] initWithAPIClient:self.apiClient];
    }

    return _venueAPI;
}

- (NSObject <RealmVenueRepository> *)realmVenueRepository {
    if (_realmVenueRepository == nil) {
        _realmVenueRepository = [[RealmVenueRepositoryImpl alloc] initWithFactory:self.realmFactory];
    }

    return _realmVenueRepository;
}

- (NSObject <VenueRepository> *)venueRepository {
    if (_venueRepository == nil) {
        _venueRepository = [[VenueRepositoryImpl alloc] initWithRealVenueRepository:self.realmVenueRepository];
    }

    return _venueRepository;
}

- (NSObject <VenueService> *)venueService {
    if (_venueService == nil) {
        _venueService = [[VenueServiceImpl alloc] initWithAPI:self.venueAPI
                                                   repository:self.venueRepository];
    }

    return _venueService;
}

@end
