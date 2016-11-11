//
// Created by Nguyen Thanh Hai on 11/7/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "User.h"
#import "SaveUserParams.h"


@implementation User

- (instancetype)initWithUsername:(NSString *)username {
    if (self = [super init]) {
        self.username = username;
    }

    return self;
}


@end