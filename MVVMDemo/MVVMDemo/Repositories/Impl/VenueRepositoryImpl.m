//
// Created by Nguyen Thanh Hai on 11/9/16.
// Copyright (c) 2016 LCL. All rights reserved.
//

#import "VenueRepositoryImpl.h"
#import "RealmUserRepository.h"
#import "VenueRepository.h"
#import "RealmVenueRepository.h"

@interface VenueRepositoryImpl ()

@property (nonatomic, strong) NSObject <RealmVenueRepository> * realmVenueRepository;

@end

@implementation VenueRepositoryImpl

- (id)initWithRealVenueRepository:(NSObject <RealmVenueRepository> *)realmVenueRepository {
    if (self = [super init]) {
        _realmVenueRepository = realmVenueRepository;
    }

    return self;
}

- (void)saveVenues:(NSArray<Venue *> *)venues complete:(void (^)(NSArray *venues))completion {
    [_realmVenueRepository saveVenues:venues complete:completion];
}


@end