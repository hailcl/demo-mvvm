//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "RealmUserRepositoryImpl.h"
#import "RealmFactory.h"
#import "SaveUserParams.h"
#import "RealmUser.h"
#import "User.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug | DDLogLevelVerbose;

@interface RealmUserRepositoryImpl ()

@property (nonatomic, strong) RealmFactory * factory;

@end

@implementation RealmUserRepositoryImpl

- (instancetype)initWithFactory:(RealmFactory *)factory {
    if (self = [super init]) {
        _factory = factory;
    }

    return self;
}

- (void)saveUser:(SaveUserParams *)params complete:(void (^)(RealmUser *user))completion {
    RealmUser * user = [RealmUser new];
    user.username = params.username;
    user.objectId = params.userid;

    __weak RLMRealm *weakRealm = _factory.realm;
    [_factory.realm transactionWithBlock:^{
        [weakRealm addOrUpdateObject:user];
        completion ? completion(user) : nil;
    }];
}

- (User *)getUserById:(NSString *)userId {
    User * model = nil;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"objectId = %@", userId];
    RLMResults <RealmUser*> * users = [RealmUser allObjects];
    NSArray <RealmUser*> * result = [users objectsWithPredicate:pred];

    if (result.count) {
        RealmUser * data = result[0];
        model = [[User alloc] initWithUsername:data.username];
    }

    return model;
}

@end