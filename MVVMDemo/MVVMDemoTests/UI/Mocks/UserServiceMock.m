//
// Created by Nguyen Thanh Hai on 11/13/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "UserServiceMock.h"


@implementation UserServiceMock

- (User *)currentUser {
    return nil;
}

- (void)loginWithParams:(LoginParams *)params complete:(void (^)(LoginError *error))completion {
    _params = params;
    _calledSignIn = YES;
}

- (void)addSubcriber:(NSObject <UserServiceSubscriber> *)subcriber {

}

- (void)signout {

}


@end