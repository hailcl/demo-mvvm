//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealmUserRepository.h"

@class RealmFactory;

@interface RealmUserRepositoryImpl : NSObject <RealmUserRepository>

- (instancetype)initWithFactory:(RealmFactory*)factory;

@end