//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "UserRepositoryImpl.h"
#import "RealmUserRepository.h"
#import "User.h"
#import "RealmUser.h"

@interface UserRepositoryImpl ()

@property (nonatomic, strong) NSObject <RealmUserRepository> * realmUserRepository;

@end

@implementation UserRepositoryImpl

- (instancetype)initWithRealmUserRepository:(NSObject <RealmUserRepository> *)realmUserRepository {
    if (self = [super init]) {
        _realmUserRepository = realmUserRepository;
    }

    return self;
}


- (void)saveUser:(SaveUserParams *)params complete:(void (^)(User *user))completion {
    [_realmUserRepository saveUser:params
                          complete:^(RealmUser *user) {

                              User * userModel = [User new];
                              userModel.username = user.username;

                              completion ? completion(userModel) : nil;
                          }];
}

- (User *)getUserById:(NSString *)userId {
    return [_realmUserRepository getUserById:userId];
}


@end