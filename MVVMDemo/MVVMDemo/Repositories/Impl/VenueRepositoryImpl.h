//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueRepository.h"

@protocol RealmVenueRepository;

@interface VenueRepositoryImpl : NSObject <VenueRepository>

- (id)initWithRealVenueRepository:(NSObject <RealmVenueRepository> *)realmVenueRepository;

@end