//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "RealmFactory.h"


@implementation RealmFactory

- (instancetype)init {
    if (self = [super init]) {
        _realm = [RLMRealm defaultRealm];
    }

    return self;
}

@end