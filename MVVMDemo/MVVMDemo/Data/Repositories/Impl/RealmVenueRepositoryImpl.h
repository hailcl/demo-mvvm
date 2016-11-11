//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealmFactory.h"
#import "RealmVenueRepository.h"

@interface RealmVenueRepositoryImpl : NSObject <RealmVenueRepository>

- (id)initWithFactory:(RealmFactory *)factory;

@end
