//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueService.h"

@protocol VenueRepository;
@protocol VenueAPI;

@interface VenueServiceImpl : NSObject <VenueService>

- (instancetype)initWithAPI:(NSObject <VenueAPI> *)api repository:(NSObject <VenueRepository> *) repository;

@end